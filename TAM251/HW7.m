clear;
close all;
clc;

%% 7.2
w = 5; % kN/m
a = 3; % m

Mo = 3 * w * a^2;
syms x;
f = w * x;
int1 = int(f, a, 3*a);
F1 = (int1 + Mo) / (3*a);
F2 = w * 2*a - F1;
vpa([F1, F2]);

%% 7.7
h = 145; % mm
b = 239; % mm
t1 = 25; % mm
t2 = 24; % mm
Mz = 1404; % N.m

A1 = t2 * (b + 2*t1);
A2 = h * t1;

ybar = (A1 * t2/2 + A1 * (t2 + h + t2/2) + 2 * A2 * (t2 + h/2)) / (2*(A1 + A2));
I1 = (b + 2*t1) * t2^3 / 12;
I2 = t1 * h^3 / 12;
Iz = 2*(I1 + I2) + A1 * ((3/2)*t2 + h - ybar)^2 + A1 * (ybar - t2/2)^2 + 2 * A2 * (t2 + h/2 - ybar)^2;
vpa(ybar);
vpa(Iz / 1e6);
vpa(ybar * Mz / (Iz / 1e3));

%% 7.8
t = 15; % mm
Mz = -1547; % N.m

A1 = 4*t * 10*t;
A2 = 2*t * 4*t;

ybar = (A1 * 2*t - A2 * 0) / (A1 - A2);
I1 = (4*t) * (10*t)^3 / 12;
I2 = (2*t) * (4*t)^3 / 12;
Iz = I1 + A1 * (ybar - 2*t)^2 - (I2 + A2 * ybar^2);
vpa(ybar);
vpa(Iz / 1e6);
vpa((ybar + 3*t) * Mz / (Iz / 1e3));

%% 7.10
t = 19; % mm
a = 38; % mm

A1 = 8*t * 12*t;
A2 = 6*t * 2*t;

ybar = -A2 * (a + t) / (A1 - A2);
vpa(ybar);

%% 7.11
t = 17; % mm
a = 34; % mm
r = 34; % mm
ybar = -2.8784; % mm

A1 = 8*t * 14*t;
A2 = pi * r^2 / 2;

I1 = 8*t * (14*t)^3 / 12;
I2 = (pi/8 - 8/9 / pi) * r^4;

Iz = I1 + A1 * ybar^2 - (I2 + A2 * (a + 4/3 * r / pi - ybar)^2);
vpa(Iz/1e6);


%% 7.12
a = 1596; % mm
b = 234; % mm
h = 155; % mm
t1 = 20; % mm
t2 = 20; % mm
sigmaT = 12; % MPa
sigmaC = 11; % MPa

A1 = t1 * h;
A2 = b * t2;

ybar = (2 * A1 * h/2 + A2 * (h + t2/2)) / (2*A1 + A2);
I1 = t1 * h^3 / 12;
I2 = b * t2^3 / 12;
Iz = 2 * (I1 + A1 * (h/2 - ybar)^2) + I2 + A2 * (h + t2/2 - ybar)^2;

mt = sigmaT * Iz / ybar;
mc = sigmaC * Iz / ybar;

w1 = 2 * mt / a^2;
w2 = 2/3 * mc / a^2;

vpa([ybar, Iz/1e6, w1, w2]);

%% ex
rpq = [2, 1, 0];
vp = [4, 0, 0];
ap = [0, 0, 0];

syms w1z vqy aqy alphak;
w1 = [0, 0, w1z];
vq = [0, vqy, 0];
aq = [0, aqy, 0];
alpha = [0, 0, alphak];

eq1 = vq == vp + cross(w1, rpq);
eq2 = aq == ap + cross(alpha, rpq) + cross(w1, cross(w1, rpq));
[w1z vqy aqy alphak] = solve([eq1, eq2], [w1z vqy aqy alphak]);
vpa([w1z vqy aqy alphak])


