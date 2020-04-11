clear;
close all;
clc;

%% 399
rQA = [-5,-1];
vP = [-1,-5];
omega = 1;

rQA = [rQA(1), rQA(2), 0];
vP = [vP(1), vP(2), 0];
w = [0, 0, omega];

vpa(vP + cross(w, rQA));

%% 449
rPA = [1,2]
rQA = [-12,-2]
omega1 = [-24]
omega2 = [-2]
vP = [48,-24]
vQ = [44,0]
aQ = [-2882,0]

rPA = [rPA(1), rPA(2), 0]; rQA = [rQA(1), rQA(2), 0];
w1 = [0, 0, omega1(1)]; w2 = [0, 0, omega2(1)];
vP = [vP(1), vP(2), 0]; vQ = [vQ(1), vQ(2), 0];
aQ = [aQ(1), aQ(2), 0];

syms alpha1 alpha2 apx apy;
aP = [apx, apy, 0];
alf1 = [0, 0, alpha1];
alf2 = [0, 0, alpha2];
eq1 = aP == cross(alf1, rPA) + cross(w1, cross(w1, rPA));
eq2 = aQ == aP + cross(alf2, rQA) + cross(w2, cross(w2, rQA));
[alpha1 alpha2 apx apy] = solve([eq1, eq2], [alpha1 alpha2 apx apy]);
vpa(alpha1);

%% 559
rQA = [1,4];
vP = [3,2];

rQA = [rQA(1), rQA(2), 0];
vP = [vP(1), vP(2), 0];

syms wz vqy;
vQ = [0, vqy, 0];
w = [0, 0, wz];
eq = vQ == vP + cross(w, rQA);
[wz vqy] = solve(eq, [wz vqy]);
vpa(wz);

%% 836
rPA = [-2,1]
rQA = [3,-2]
vP = [3,-3]
vQ = [0,3]

rPA = [rPA(1), rPA(2), 0]; rQA = [rQA(1), rQA(2), 0];
vP = [vP(1), vP(2), 0]; vQ = [vQ(1), vQ(2), 0];

syms alpha1 alpha2;
eq = vP + cross([0, 0, alpha1], rPA) == vQ + cross([0, 0, alpha2], rQA);
[alpha1 alpha2] = solve(eq, [alpha1 alpha2]);
vpa(vP + cross([0, 0, alpha1], rPA))
































