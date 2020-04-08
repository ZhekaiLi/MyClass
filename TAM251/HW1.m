clear;
close all;
clc;

%% 1.2
b = 1; % in
h = 6; % in
sigma = 2; % psi
tau = 7; % psi
alpha = 54; % degrees

syms P;
F = P * sind(alpha);
A = h / sind(alpha) * b;
eq = sigma == F / A;
P = solve(eq, P);
vpa(P);

%% 1.3
A1 = 244; % mm^2
A2 = 138; % mm^2
P1 = 50; % kN
P2 = 43; % kN

vpa((P2 - P1) / A1 * 1000);
vpa((P2) / A2 * 1000);

%% 1.4 1.5 1.6

%% 1.7
a = 311; % mm
b = 269; % mm
c = 178; % mm
d = 211; % mm
e = 197; % mm
P1 = 54; % kN
P2 = 92; % kN
theta = 28; % degrees
dab = 46; % mm

syms f;
eq = P1 * b + P2 * (b+c) == f * (d + e + a*sind(theta)) * cosd(theta);
f = solve(eq, f);
vpa(f/(pi * (dab/2)^2) * 1000);

%% 1.8
a = 672; % mm
b = 84; % mm
c = 504; % mm
d = 168; % mm
L = 1680; % mm
w = 6; % kN/m
Ac = 55; % mm^2

a = a/1000; b = b/1000; c = c/1000; d = d/1000; L = L/1000; w = w*1000; Ac = Ac/1000000;

syms x;
f = x * w * (L-x) / L;
int1 = int(f, 0, L);
fy = int1 / (a+b);
fx = fy / (c+d) * (a+b);
ff = (fy^2 + fx^2)^0.5;
vpa(ff/Ac);

%% 1.9
W = 3; % kN
a = 4; % m
b = 4; % m
d = 15; % mm
theta = 44; % degrees

fb = W * (a+b) / a;
fa = fb - W;
A = pi * (d/2)^2;
vpa(fa/A)












