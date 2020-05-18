clear;
close all;
clc;

%% 5.1
L = 1645; % mm
r = 22; % mm
G = 69; % GPa
tu = 55; % MPa
FS = 2;

L = L/1e3; r = r/1e3; G = G*1e9; tu = tu*1e6; 

tbyj = tu/r;
vpa(tbyj * L / G / FS);

%% 5.2
L = 1697; % mm
d = 34; % mm
kt = 1; % kN.m
T = 1950; % N.m

L = L/1e3; d = d/1e3; kt = kt*1e3;

vpa(T * d/2 / kt / L * 1e3);

%% 5.3
L = 1673; % mm
di = 14; % mm
do = 30; % mm
G = 32; % GPa
T = 1961; % N.m

L = L/1e3; do = do/1e3; di = di/1e3; G = G*1e9;

J = pi / 32 * (do^4 - di^4);
vpa(T * di/2 / J / G * 1e3);

%% 5.4
L1 = 301; % mm
L2 = 373; % mm
d1 = 67; % mm
d2 = 50; % mm
G1 = 30; % GPa
G2 = 34; % GPa
TB = 624; % N.m
TC = 892; % N.m

L1 = L1/1e3; L2 = L2/1e3; d1 = d1/1e3; d2 = d2/1e3; G1 = G1*1e9; G2 = G2*1e9;

j1 = pi * d1^4 / 32;
j2 = pi * d2^4 / 32;


db = (TC - TB) * L1 / G1 / j1;
dc = (TC) * L2 / G2 / j2;
vpa(dc + db);

%% 5.5
L1 = 393; % mm
L2 = 347; % mm
d1 = 72; % mm
d2 = 46; % mm
G1 = 35; % GPa
G2 = 32; % GPa
TB = 930; % N.m
TC = 933; % N.m

L1 = L1/1e3; L2 = L2/1e3; d1 = d1/1e3; d2 = d2/1e3; G1 = G1*1e9; G2 = G2*1e9;

j1 = pi * d1^4 / 32;
j2 = pi * d2^4 / 32;

vpa(TC * d2/2 / j2 /1e6);
vpa((TC - TB) * d1/2 / j1 /1e6);

%% 5.6
d = 60; % mm
TB = 1390; % N.m
TC = 693; % N.m

d = d/1e3;

j1 = pi / 32 * (d^4 - (d/2)^4);
j2 = pi / 32 * d^4;

vpa(-TC * d/2 / j2 /1e6);
vpa((TB - TC) * d/2 / j1 /1e6);

%% 5.7
Rb = 93; % mm
Rc = 40; % mm
ft = 0.000004; % (1/N.m)
TD = 614; % N.m

Rb = Rb/1e3; Rc = Rc/1e3;

db = TD * (Rb/Rc) * ft;
dc = db * Rb / Rc;

ddc = TD * ft;
vpa(ddc + dc);

%% 5.8
Rb = 70; % mm
Rc = 39; % mm
d = 12; % mm
TD = 43; % N.m

Rb = Rb/1e3; Rc = Rc/1e3; d = d/1e3;

vpa(TD * Rb/Rc * d/2 / (pi/32 * d^4) /1e6);

%% 5.9
a = 1321; % mm
b = 1720; % mm
d = 31; % mm
G = 60; % GPa
tall = 20; % MPa

a = a/1e3; b = b/1e3; d = d/1e3; G = G*1e9; tall = tall*1e6;

syms P;
T = P * a;
J = pi/32 * d^4;
eq = tall == T * d/2 / J;
P = solve(eq, P);

sita = P*a * b / (G * J);
vpa([P, sita]);













