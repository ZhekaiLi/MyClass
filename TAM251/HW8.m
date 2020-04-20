clear;
close all;
clc;

%% 8.1
b = 24; % mm
t = 5; % mm
Vy = 31; % kN

A1 = (4*b + 2*t) * (4*b + 6*t);
A2 = 2*b * (2*t + 2*b);
A3 = t * 2*t;
A = A1 - 2*A2 - 2*A3;

I1 = (4*b + 2*t) * (4*b + 6*t)^3 / 12;
I2 = (2*b)^3 * (2*t + 2*b) / 12 + A2 * (2*t + b)^2;
I3 = t^3 * 2*t + A3 * (2*t + 2*b + t/2)^2;
I = I1 - 2*I2 - 2*I3;

Aq = (2*b + t) * (4*b + 2*t);
yq = b + t/2 + 2*t;
y2 = 2*t + b;
y3 = 2*b + 2*t + t/2;
Q = Aq * yq - A2 * y2 - A3 * y3;
tao = Vy * Q / I / (2*b);
vpa(tao * 1e3);

%% 8.2
t1 = 5; % mm
t2 = 7; % mm
b = 71; % mm
h = 89; % mm
ybar = 61.69971; % mm
Iz = 1324275.26322; % mm^4
Vy = 31; % kN
Mz = 699; % N.m

sigma = Mz * (t2 + h - ybar) / Iz;
A = t1 * ybar;
y = ybar/2;
Q = 2 * A * y;
tao = Vy * Q / Iz / (2*t1);
vpa([sigma * 1e3, tao * 1e3]);

%% 8.3
% similar to 8.4
%% 8.4
h = 2; % in
a = 31; % in
P = 6; % kips
s1 = 294; % psi
s2 = 150; % psi

syms b1 b2;
eq1 = b1 * 3*h * s1 == P;

I = b2 * (3*h)^3 / 12;
Q = b2*h * h;
eq2 = s2 == P * Q / I / b2;
[b1, b2] = solve([eq1, eq2], [b1, b2]);
vpa([b1, b2]);

%% 8.5
b = 33; % mm
V = 6; % kN
V = V * 1e3;

I1 = (3*b) * (4*b)^3 / 12;
I2 = b * (2*b)^3 / 12;
I = I1 - 2*I2;

A1 = b * b; y1 = b + b/2;
Q1 = A1 * y1;
tau = V * Q1 / I / b;
vpa(tau);

%% 8.6
h = 184; % mm
t = 40; % mm
d = 20; % mm
taub = 4; % MPa
V = 2; % kN

V = 1e3 * V;

ybar = h * 2/3;
A1 = t * h;
I1 = t * h^3 / 12;
I = I1 * 3 + 2 * A1 * (ybar - h/2)^2 + A1 * (h - ybar)^2;

Aa = t * (h + h/2 - ybar);
Ad = t * (ybar - h/2);
ybar1 = (h + h/2 - ybar)/2;
ybar2 = (ybar - h/2)/2;
Q = Aa * ybar1 - Ad * ybar2;
q = V * Q / I;
F = 2 * taub * pi * d^2/4;
vpa(F/q);

%% 8.7
b = 200; % mm
t = 39; % mm
d = 18; % mm
deltaS = 82; % mm
Vy = 3; % kN

Vy = Vy * 1e3;

A = t * b;
I = 2*(t * b^3/12) + 2*(b * t^3/12) + 2*A * (b/2 + t/2)^2;
Q = A * (b/2 + t/2);

q = Vy * Q / I;
F = q * deltaS;
tau = F / (2*pi*d^2/4);

vpa(tau);


%% 8.8
D = 221; % mm
d = 102; % mm
V = 70; % kN

V = V * 1e3;

I = pi * D^4/64 - pi * d^4/64;

A1 = pi * D^2/4 /2;
A2 = pi * d^2/4 /2;
A = A1 - A2;
ybar = (A1 * 2*D/3/pi - A2 * 2*d/3/pi) / A;
Q = ybar * A;

tau = V * Q / I / (D-d);

vpa([I/1e6, Q/1e3, tau]);

%% 8.9
b = 47; % in
t = 5; % in
d = 0.74; % in
deltaS = 52; % in
Vmax = 3; % lb

A = t * b;
I = t * b^3/12 + 2 * b * t^3/12 + 2 * A * (b/2 + t/2)^2;

ybar1 = b/2 + t/2;
A1 = b * t;
Q1 = ybar1 * A1;
V1 = Vmax / deltaS * I / Q1;

ybar2 = ybar1;
A2 = (b - t)/2 * t;
Q2 = ybar2 * A2;
V2 = Vmax / deltaS * I / Q2;

vpa([I/1e3, V1, V2]);







