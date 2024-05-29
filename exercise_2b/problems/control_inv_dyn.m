function [ tau ] = control_inv_dyn(I_r_IE_des, eul_IE_des, q, q_dot)
% CONTROL_INV_DYN Operational-space inverse dynamics controller with a PD 
% stabilizing feedback term.
%
% I_r_IE_des --> a vector in R^3 which describes the desired position of the
%   end-effector w.r.t. the inertial frame expressed in the inertial frame.
% eul_IE_des --> a set of Euler Angles XYZ which describe the desired
%   end-effector orientation w.r.t. the inertial frame.
% q --> a vector in R^n of measured joint angles
% q_dot --> a vector in R^n of measured joint velocities

% Set the joint-space control gains.
kp = 1; % TODO
kd = 1; % TODO

% Find jacobians, positions and orientation based on the current
% measurements.
I_J_e = I_Je_fun_solution(q);
I_dJ_e = I_dJe_fun_solution(q, q_dot);
T_IE = T_IE_fun_solution(q);
I_r_Ie = T_IE(1:3, 4);
C_IE = T_IE(1:3, 1:3);

% Define error orientation using the rotational vector parameterization.
C_IE_des = eulAngXyzToRotMat(eul_IE_des);
C_err = C_IE_des*C_IE';
orientation_error = rotMatToRotVec_solution(C_err);

% Define the pose error.
chi_err = [I_r_IE_des - I_r_Ie;
           orientation_error];

% PD law, the orientation feedback is a torque around error rotation axis
% proportional to the error angle.
% to calculate the end effector velocity we can use the joint velocity
end_effector_vel= I_J_e*q_dot;
%tau = zeros(6, 1); % TODO

% we should use inverse dynamics M(q)ddq+b(q,dq)+g(q)
b=b_fun_solution(q,q_dot);
g=g_fun_solution(q);
M=M_fun_solution(q);

% calculating the acceleration of the end effector we
end_effector_ref=zeros(6,1);
d_we=kp*(chi_err)+kd*( end_effector_ref-end_effector_vel)

%convert d_we to q_dot_dot
% q_dot_dot can be calculated by using  q_dot_dot= J^-1*(we*-dJ * dq)
q_dot_dot=pinv(I_J_e)(d_we-(I_dJ_e*q_dot));

tau=(M*q_dot_dot)+b+g;

end