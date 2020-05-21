clear;
close all;
clc;

%% 337
vP = [5, -5, 0];
vQ = [-4, 4, 0];
P = [0, 0, 0];

syms omega mx my qx qy;
omg = [0, 0, omega];
M = [mx, my, 0];
Q = [qx, qy, 0];
rMP = P - M;
rMQ = Q - M;
rPQ = Q - P;
eq1 = vP == cross(omg, rMP);
eq2 = vQ == cross(omg, rMQ);
eq3 = vQ == vP + cross(omg, rPQ);
[omega mx my qx qy] = solve([eq1, eq2, eq3], [omega mx my qx qy]);
M = [mx, my, 0];
Q = [qx, qy, 0];
vpa([norm(P-M), norm(Q-M)])

%% 479
r = 9;
vQ = [9, 9, 0];

syms omega;
omg = [0, 0, omega];
rOC = [0, r, 0];
rCQ = [-r, 0, 0];
vC = cross(omg, rOC);
eq = vQ == vC + cross(omg, rCQ);
omega = solve(eq, omega);
vpa(omega);

%% 689
r = 1;
aQMag = 12;
omg = [0, 0, 3];
alf = [0, 0, 2]; 

rOC = [0, r, 0];
rCQ = [0, -r, 0];
syms rou;
R = rou - r;
vC = cross(omg, rOC);
aC = [-alf(3)*r, vC(1)^2/R, 0];
aQ = aC + cross(alf, rCQ) + cross(omg, cross(omg, rCQ));
rou = solve(norm(aQ) == aQMag, rou);
vpa(rou);

%% 893
rho = 41;
omega = 5;
alpha = -9;
r = [3,-8,0];

rCQ = r;
r = norm(rCQ);
omg = [0, 0, omega];
alf = [0, 0, alpha];
R = rho + r;

rOC = [0, r, 0];
vC = cross(omg, rOC);
aC = [-alf(3)*r, -vC(1)^2/R, 0];
aQ = aC + cross(alf, rCQ) + cross(omg, cross(omg, rCQ));
vpa(aQ);


%% 980
% ÓëľŘĂć˝Ó´ĽľÄźÓËŮśČ = [0, omega(3)^2 * r, 0]
omega = [0, 0, 6];
aQ = [3,-8, 0];

syms r alpha;
alf = [0, 0, alpha];
rOC = [0, r, 0];
rCQ = [r, 0, 0];
aO = [0, omega(3)^2 * r, 0];
aC = aO + cross(alf, rOC) + cross(omega, cross(omega, rOC));
eq = aQ == aC + cross(alf, rCQ) + cross(omega, cross(omega, rCQ));
[r alpha] = solve(eq, [r alpha]);
vpa(r);
