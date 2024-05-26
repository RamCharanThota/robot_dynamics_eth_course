% generate equations of motion
function eom = generate_eom(gen_cor, kin, dyn, jac)
% By calling:
%   eom = generate_eom(gen_cor, kin, dyn, jac)
% a struct 'eom' is returned that contains the matrices and vectors
% necessary to compute the equations of motion. These are additionally
% converted to matlab scripts.

%% Setup
phi = gen_cor.phi;      % Generalized coordinates (6x1 sym)
dphi = gen_cor.dphi;    % Generalized velocities (6x1 sym)

T_Ik = kin.T_Ik;        % Homogeneous transforms (6x1 cell)->(4x4 sym)
R_Ik = kin.R_Ik;        % Rotation matrices (6x1 cell)->(3x3 sym)

k_I_s = dyn.k_I_s;      % Inertia tensor of body k in frame k (6x1 cell)->(3x3 sym)
m = dyn.m;              % Mass of body k (6x1 cell)->(1x1 double)
I_g_acc = dyn.I_g_acc;  % Gravitational acceleration in inertial frame (3x1 double)
k_r_ks = dyn.k_r_ks;    % CoM location of body k in frame k (6x1 cell)->(3x1 double)

I_Jp_s = jac.I_Jp_s;    % CoM Positional Jacobian in frame I (6x1 cell)->(3x6 sym)
I_Jr = jac.I_Jr;        % CoM Rotational Jacobian in frame I (6x1 cell)->(3x6 sym)

I_Jpe=jac.I_Jpe ;
I_Jre=jac.I_Jre ;

I_dJpe=jac.I_dJpe;
I_dJre=jac.I_dJre;

eom.M = sym(zeros(6,6));
eom.g = sym(zeros(6,1));
eom.b = sym(zeros(6,1));
eom.hamiltonian = sym(zeros(1,1));


%% Compute mass matrix
fprintf('Computing mass matrix M... ');
% TODO: Implement M = ...;
part1=zeros(6,6);
part2=zeros(6,6);
for i =1:numel(phi)

    part1=part1+(I_Jp_s{i}'*(m{i}*I_Jp_s{i}));
    b_Jr_i= (R_Ik{i})'*I_Jr{i};
    part2=part2+((b_Jr_i')*(k_I_s{i}*b_Jr_i));
end

M=part1+part2;
fprintf('done!\n');

%% Compute gravity terms
fprintf('Computing gravity vector g... ');

g_sum=zeros(6,1);
for i =1:numel(phi)

    g_sum=g_sum+(I_Jp_s{i}'*(m{i}*I_g_acc));
end

g=-g_sum;
%% Compute nonlinear terms vector
fprintf('Computing coriolis and centrifugal vector b and simplifying... ');
% TODO: Implement b = ...;

b_sum=zeros(6,1);
for i =1:numel(phi)

    %calculate first part of the b equation
    I_dJp_s=dAdt(I_Jp_s{i},phi,dphi);
    b1=(I_Jp_s{i}')*(m{i}*I_dJp_s*dphi);

    %calculate the second part of the b equation
    b_Jr_i= (R_Ik{i})'*I_Jr{i};
    b_dJr_i=dAdt(b_Jr_i,phi,dphi);

    b_omega_i=b_Jr_i*dphi;

    dummy1=cross(b_omega_i,(k_I_s{i}*b_omega_i));
    dummy2=(k_I_s{i}*b_dJr_i*dphi)+dummy1;

    b2=b_Jr_i'*dummy2;

    b_sum=b_sum+b1+b2;
end

b=b_sum;


fprintf('done!\n');



%% Compute energy
fprintf('Computing total energy... ');
% TODO: Implement hamiltonian, enPot, enKin = ...;
ke=0.5*(dphi')*(M)*(dphi);
enPot=sym(0);
for i =1:numel(phi)
   i_r_ks=[eye(3) zeros(3,1)]*(T_Ik{i}*[k_r_ks{i};1]);

    enPot=enPot-(m{i}*(I_g_acc'*i_r_ks));
end

% enPot = sym(0);
% for k=1:length(phi)
%     enPot = enPot - m{k}*I_g_acc'*[eye(3) zeros(3,1)]*T_Ik{k}*[k_r_ks{k};1];
% end


%enPot=-pe_sum;
enKin=ke;

hamiltonian = simplify(enKin+enPot);

fprintf('done!\n');


%% Generate matlab functions
fname = mfilename;
fpath = mfilename('fullpath');
dpath = strrep(fpath, fname, '');

fprintf('Generating eom scripts... ');
fprintf('M... ');
matlabFunction(M, 'vars', {phi}, 'file', strcat(dpath,'/M_fun'), 'Optimize', false);
fprintf('g... ');
matlabFunction(g, 'vars', {phi}, 'file', strcat(dpath,'/g_fun'), 'Optimize', false);
fprintf('b... ');
matlabFunction(b, 'vars', {phi, dphi}, 'file', strcat(dpath,'/b_fun'), 'Optimize', false);
fprintf('hamiltonian... ');
matlabFunction(hamiltonian, 'vars', {phi, dphi}, 'file', strcat(dpath,'/hamiltonian_fun'), 'Optimize', false);
fprintf('done!\n');


%% Store the expressions
eom.M = M;
eom.g = g;
eom.b = b;
eom.hamiltonian = hamiltonian;
eom.enPot = enPot;
eom.enKin = enKin;

end
