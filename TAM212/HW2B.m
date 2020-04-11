clear;
close all;
clc;

%% 140
x = -4;
y = 2;
z = -4;
v = 4;
uvec = [2,4,-5];

r = [x, y, z];
nvec = uvec / norm(uvec);
syms m x1 y1 z1;
omega = m * nvec;
vv = [x1, y1, z1];
eq1 = norm(vv) == v;
eq2 = vv == cross(omega, r);

[m, x1, y1, z1] = solve([eq1, eq2], [m, x1, y1, z1]);
vpa(m);

%% 288
x0 = -5;
y0 = -3;

r = (x0^2 + y0^2)^0.5;
syms t;
dsita = -2 * t^2 / r;
sita0 = atan(y0/x0) + pi;
sita(t) = -2 / (3 * r) * t^3 + sita0;

sita5 = sita(5);
vpa([r*cos(sita5), r*sin(sita5)]);






k = 10;
lenta = 0.5;
syms u x t;
rk = int(u^(k-1) * exp(-u), 0, Inf);

P = int(lenta^k / rk * x^(k-1) * exp(-lenta * x), 0, t);
t = solve(P == 0.95, t)





