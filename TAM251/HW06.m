clear;
close all;
clc;

%% 6.1
R1 = 192; % mm
R2 = 48; % mm
d = 26; % mm
TW = 4025; % N.mm

J = pi * d^4 / 32;
vpa(TW * d/2 / J * R1^2/R2^2);

%% 6.2
d = 30; % mm
R1 = 92; % mm
R2 = 46; % mm
G = 75; % GPa
L = 140; % mm
TE = 423; % N.m

J = pi * d^4 / 32;
TK = R1^2/R2^2 * TE;
F1 = TK / R2;
T = F1 * R1;
sita = T * L / G / J;
sitaK = TK * L / G / J;
vpa(sita);
vpa(sitaK);
vpa(sita - sitaK);

%% 6.3
di = 22; % mm
TB = 1451; % N.m
TC = 574; % N.m
G = 109; % MPa
L = 1275; % mm
tauMax = 16; % MPa

tauMax = tauMax * 1e6;
L = L / 1e3;
G = G * 1e6;
di = di / 1e3;

T1 = TB - TC;
T2 = -TC;
syms d;
J = pi * d^4 / 32;
eq = tauMax == T1 * d/2 / J;
d = solve(eq, d);

J1 = pi * d(1)^4 / 32;
sita1 = T1 * L / G / J1;
J2 = pi * (d(1)^4 - di^4) / 32;
sita2 = T2 * L / G / J2;

vpa([T1, T2]);
vpa(d(1) * 1e3);
vpa(sita1 + sita2);

%% 6.4
d = 54; % mm
L = 121; % mm
G = 54; % GPa
TB = 1405; % N.m

d = d / 1e3; L = L / 1e3; G = G * 1e9;

J1 = pi * (d^4 - (d/2)^4) / 32;
J2 = pi * (d^4) / 32;
syms sita;
eq = TB == sita * G * (J1+J2) / L ;
sita = solve(eq, sita);
vpa(sita);

%% 6.5
L1 = 276; % mm
L2 = 749; % mm
L3 = 280; % mm
d1 = 28; % mm
d2 = 52; % mm
G = 60; % GPa
Tb = 1436; % N.m
Tc = 1462; % N.m

L1 = L1/1e3; L2 = L2/1e3; L3 = L3/1e3; d1 = d1/1e3; d2 = d2/1e3; G = G*1e9;
J1 = pi * d1^4 / 32;
J2 = pi * d2^4 / 32;
J3 = pi * (d2^4 - d1^4) / 32;

syms Ta;
T1 = Ta;
T2 = Ta + Tb;
T3 = Ta + Tb - Tc;
eq2 = T1 * L1 / J1 + T2 * L2 / J2 + T3 * L3 / J3 == 0;
[Ta] = solve([eq2], [Ta]);
vpa((Ta + Tb - Tc) * d2/2 / J3 / 1e6);

%% 6.6
L = 48; % in
Ga = 3000; % ksi
Gs = 10000; % ksi
da = 6; % in
ds = 5; % in
Tb = 4; % kip.in

Ja = pi * (da^4 - ds^4) / 32;
Js = pi * ds^4 / 32;

syms Ta Ts;
eq1 = Ta + Ts == Tb;
eq2 = Ta / Ga / Ja == Ts / Gs / Js;
[Ta, Ts] = solve([eq1, eq2], [Ta, Ts]);
vpa(Ts * L /  Gs / Js);

%% 6.7
L = 40; % in
Ga = 5000; % ksi
Gs = 10000; % ksi
da = 6; % in
ds = 5; % in
Tb = 2; % kip.in

Ja = pi * (da^4 - ds^4) / 32;
Js = pi * ds^4 / 32;

syms Ta Ts;
eq1 = Ta + Ts == Tb;
eq2 = Ta / Ga / Ja == Ts / Gs / Js;
[Ta, Ts] = solve([eq1, eq2], [Ta, Ts]);
vpa(Ts * ds/2 / Js);







