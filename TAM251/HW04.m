clear;
close all;
clc;

%% 4.1
k1 = 219; % N/mm
k2 = 115; % N/mm
L = 200; % mm
theta = 23; % degrees
P = 12; % N

syms dc;
da = dc * cosd(theta);
eq2 = dc * k2 * L + da * k1 * cosd(theta) * L == P * L/2;
[dc] = solve([eq2], [dc]);
vpa(dc);

%% 4.2
h = 109; % mm
b = 102; % mm
d = 24; % mm
E1 = 183; % MPa
E2 = 132; % MPa
W = 80; % N

sita1 = atand(h / b);
sita2 = atand(h / b / 2);
A = pi * (d / 2)^2;
L1 = (h^2 + b^2)^0.5;
L2 = (h^2 + 4 * b^2)^0.5;
syms d;
d1 = d * sind(sita1);
d2 = 2 * d * sind(sita2);
F1 = d1 / L1 * E1 * A;
F2 = d2 / L2 * E2 * A;
eq = (F1 * sind(sita1) - W / 2) * b + (F2 * sind(sita2) - W / 2) * 2 * b == 0;
d = solve(eq, d);

vpa(sind(sita1) / 2 / sind(sita2))
vpa(d1 / F1)
vpa(d2 / F2)
vpa(F1 / F2)
vpa(d * sind(sita1) / L1 * E1)
vpa(2 * d * sind(sita2) / L2 * E2)


%% 4.3
E1 = 68; % GPa
E2 = 210; % GPa
d = 29; % mm
D = 43; % mm
L = 700; % mm
P = 87; % kN

Ar = pi * (d/2)^2;
At = pi * ((D/2)^2 - (d/2)^2);
syms Ft Fr;
eq1 = P == Ft + Fr;
eq2 = Fr / E1 / Ar == Ft / E2 / At;
[Ft, Fr] = solve([eq1, eq2], [Ft, Fr]);
stress = Ft / At;
vpa(stress*1000);
% 注意正负号：拉伸正，压缩负
% 注意单位：1GPa = 1000MPa

%% 4.4
k1 = 900000; % kN/m
k2 = 600000; % kN/m
P = 38; % kN

db = P / 2  / k2 * 1000;
dc = db + P / k1 * 1000;
vpa([db, dc]);

%% 4.5
E1 = 75; % GPa
E2 = 208; % GPa
A = 1706; % mm^2
L = 737; % mm
deltaM = 0.7; % mm

syms d1 F;
d2 = deltaM - d1;
eq1 = d1 == F * L / E1 / A;
eq2 = d2 == F * L / E2 / A;
[d1, F] = solve([eq1, eq2], [d1, F]);
vpa(d1/L*1000);

%% 4.6
deltaM = 2; % mm
k1 = 40000; % N/mm
k2 = 18000; % N/mm
L = 2000; % mm

syms d1;
eq = d1 * k1 == (deltaM - d1) * k2;
d1 = solve(eq, d1);
vpa(d1/L*1000);

%% 4.7
delta = 0.01; % in
L = 12; % in
E = 30000; % ksi
alpha = 0.000005; % /degrees F
A = 3; % in^2
dT = -58; % degrees F

d = alpha * dT * L;
td = delta + d;
strain = td / L;
vpa(strain * E);

%% 4.8
dBrass = 24; % mm
dSteel = 16; % mm
Ls = 793; % mm
Lb = 735; % mm
Es = 195; % GPa
Eb = 119; % GPa
P = 42; % kN

ds = dSteel;
db = dBrass;
As = (ds / 2)^2 * pi;
Ab = (db / 2)^2 * pi;
syms d;
eq = P == d / Ls * Es * As + 2 * d / Lb * Eb * Ab;
d = solve(eq, d);
vpa(d / Lb * Eb * 1000);
vpa(d / Ls * Es * 1000);


























