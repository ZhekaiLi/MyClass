clear;
close all;
clc;

%% 163
rou = 5;

syms x y;
yup = -x^2 - 2*x + 11;
ydown = -x^2 - 2*x - 2;
xleft = 1;
xright = 2;
Px = 2;
Py = 3;
% 求Ic
If = rou * ((Px - x)^2 + (Py - y)^2);
I = int(int(If, y, ydown, yup), x, xleft, xright);
vpa(I);


%% 198
L1 = 12;
rho1 = 7;
L2 = 3;
rho2 = 3;
L3 = 3;
rho3 = 9;

w = 3;

m1 = L1 * rho1 * w; m2 = L2 * rho2 * w; m3 = L3 * rho3 * w;
m = m1 + m2 + m3;
x1 = L1/2; x2 = L1 + L2/2; x3 =  L1 + L2 + L3/2;
x = (m1 * x1 + m2 * x2 + m3 * x3) / m;
I1 = m1 * (L1^2 + w^2)/12;
I2 = m2 * (L2^2 + w^2)/12;
I3 = m3 * (L3^2 + w^2)/12;
I = I1 + m1 * (x - x1)^2 + I2 + m2 * (x - x2)^2 + I3 + m3 * (x - x3)^2;
vpa(I);

%% 343
rou = 6;

syms x y;
yup = 2*x^2 - 8*x + 11;
ydown = -x^2 - 4*x - 6;
xleft = 1;
xright = 2;
A = int(yup - ydown, x, xleft, xright);
m = rou * A;
vpa(m);

%% 414
m1 = 4;
m2 = 6;
I1O = 6;
I2C = 34;
rOP = [1,-1,0];
rPQ = [-8,-2,0];
omega1 = -8;
omega2 = -1;
vP = [-8,-8,0];
vQ = [-10,0,0];
M = -1499.5;
Fp = [-864,-143.5,0];
alpha1 = -82;
alpha2 = -2;

Alpha1 = [0, 0, alpha1];
Alpha2 = [0, 0, alpha2];
Omega1 = [0, 0, omega1];
Omega2 = [0, 0, omega2];
aP = cross(Alpha1, rOP) + cross(Omega1, cross(Omega1, rOP));
% for rod
rPC = rPQ * (1/2);
aC = aP + cross(Alpha2, rPC) + cross(Omega2, cross(Omega2, rPC));
syms x y;
Fq = [x, y, 0];
eq = Fq + Fp == m2 * aC;
[x y] = solve(eq, [x y]);
vpa([x y]);

%% 629
rou = 3;

syms x y;
yup = x^2 + 2*x + 2;
ydown = 2*x^2 - 9;
xleft = -2;
xright = 2;
% 求质心
A = int(yup - ydown, x, xleft, xright);
xbar = 1/A * int(x * (yup - ydown), xleft, xright);
ybar = 1/A * int((yup + ydown)/2 * (yup - ydown), x, xleft, xright);
% 求Ic
If = rou * ((xbar - x)^2 + (ybar - y)^2);
I = int(int(If, y, ydown, yup), x, xleft, xright);
vpa(I);

%% 595
m1 = 8;
m2 = 4;
m3 = 3;
r2 = [3,4,0];
r3 = [-7,5,0];
rC = [13,-5];

rC = [rC(1), rC(2), 0];
syms x y;
r1 = [x, y, 0];
eq = (r1 * m1 + r2 * m2 + r3 * m3) / (m1 + m2 + m3) == rC;
[x y] = solve(eq, [x y]);
vpa([x y]);

%% 741
L1 = 5;
rho1 = 4;
L2 = 8;
rho2 = 5;
L3 = 4;
rho3 = 2;

m1 = L1 * rho1; m2 = L2 * rho2; m3 = L3 * rho3;
m = m1 + m2 + m3;
x1 = L1/2; x2 = L1 + L2/2; x3 =  L1 + L2 + L3/2;
x = (m1 * x1 + m2 * x2 + m3 * x3) / m;

vpa(x);













