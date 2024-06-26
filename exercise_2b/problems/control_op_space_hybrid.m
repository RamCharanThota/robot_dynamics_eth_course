function [ tau ] = control_op_space_hybrid( I_r_IE_des, eul_IE_des, q, dq, I_F_E_x )
% CONTROL_OP_SPACE_HYBRID Operational-space inverse dynamics controller 
% with a PD stabilizing feedback term and a desired end-effector force.
%
% I_r_IE_des --> a vector in R^3 which describes the desired position of the
%   end-effector w.r.t. the inertial frame expressed in the inertial frame.
% eul_IE_des --> a set of Euler Angles XYZ which describe the desired
%   end-effector orientation w.r.t. the inertial frame.
% q --> a vector in R^n of measured joint positions
% q_dot --> a vector in R^n of measured joint velocities
% I_F_E_x --> a scalar value which describes a desired force in the x
%   direction

% Design the control gains
kp = 50.0;   %???????????????
kd = 2.0*sqrt(kp);
kpMat = kp * diag([1.0 1.0 1.0 1.0 1.0 1.0]);   %?????????????
kdMat = kd * diag([1.0 1.0 1.0 1.0 1.0 1.0]);


% Desired end-effector force
I_F_E = [I_F_E_x, 0.0, 0.0, 0.0, 0.0, 0.0]';

% Find jacobians, positions and orientation
I_Je = I_Je_fun_solution(q);
I_dJ_e = I_dJe_fun_solution(q, dq);
T_IE = T_IE_fun_solution(q);
I_r_IE = T_IE(1:3, 4);
C_IE = T_IE(1:3, 1:3);

% Define error orientation using the rotational vector parameterization.
C_IE_des = eulAngXyzToRotMat(eul_IE_des);
C_err = C_IE_des*C_IE';
orientation_error = rotMatToRotVec_solution(C_err);

% Define the pose error.
chi_err = [I_r_IE_des - I_r_IE;
           orientation_error];

M=M_fun_solution(q);
b=b_fun_solution(q,dq);
g=g_fun_solution(q);

% Project the joint-space dynamics to the operational space
% TODO
lambda =pinv(I_Je*pinv(M)*I_Je');
mu = (lambda*I_Je*pinv(M)*b)-(lambda*I_dJ_e*dq);
p = lambda*I_Je*pinv(M)*g;
% Define the motion and force selection matrices.
% TODO

% Sm = [(C_IE'*sigma_p*C_IE),zeros(3,3);zeros(3,3),(C_IE'*sigma_r*C_IE)];
% Sf = [(C_IE'*(eye(3)-sigma_p)*C_IE),zeros(3,3);zeros(3,3),(C_IE'*(eye(3)-sigma_r)*C_IE)] ;

Sm=diag([0,1,1,1,1,1]);
Sf=eye(6)-Sm;


% Design a controller which implements the operational-space inverse
% dynamics and exerts a desired force.
%end effector velocity
dchi = I_Je * dq;
we_d= kpMat*chi_err-kdMat*dchi;

tau = I_Je'*((lambda*Sm*we_d)+(Sf*I_F_E)+mu+p); % TODO

end