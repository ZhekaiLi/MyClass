clear;
close all;
clc;

%% 357
rP = [3, -2, 0];
rQ = [-4, -2, 0];
vP = [-18, 48, 0];
vQ = [-18, 6, 0];

syms x y omega;
rM = [x, y, 0];
MP = rP - rM;
MQ = rQ - rM;
eq1 = vP == cross([0, 0, omega], MP);
eq2 = vQ == cross([0, 0, omega], MQ);
[x y omega] = solve([eq1, eq2], [x y omega]);
vpa([x y omega])

%% 465
rP = [-1,-1, 0];
vP = [-4,-3, 0];
omega = 2;

syms x y;
rM = [x, y, 0];
MP = rP - rM;
eq = vP == cross([0, 0, omega], MP);
[x, y] = solve(eq, [x, y]);
vpa([x, y]);

%% 489
rCQ = [-4,3,0];
vQ = [40,20,0];

r = norm(rCQ);
% 另圆与地面的接触点为M
rMC = [0, r, 0];
syms omega;
vC = cross([0, 0, omega], rMC);
eq = vQ == vC + cross([0, 0, omega], rCQ);
omega = solve(eq, omega);
vpa(omega);


