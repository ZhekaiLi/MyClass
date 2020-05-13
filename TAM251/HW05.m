clear;
close all;
clc;

%% 5.1
L = 1664; % mm
r = 22; % mm
G = 66; % GPa
tu = 55; % MPa
FS = 3;

G = G * 1000;
tbyj = tu/r;
vpa(tbyj * L / G / FS);

%% 5.2
L = 1766; % mm
d = 28; % mm
kt = 3; % kN.m
T = 1294; % N.m

vpa(T * d / 2 / kt / L);

%% 5.3
L = 1787; % mm
di = 19; % mm
do = 33; % mm
G = 33; % GPa
T = 1918; % N.m

do = do/1000;
di = di/1000;
G = G * 10^9;

J = pi / 32 * (do^4 - di^4);
vpa(T * di/2 / J / G * 1000);

%% 5.4
L1 = 374; % mm
L2 = 358; % mm
d1 = 80; % mm
d2 = 45; % mm
G1 = 35; % GPa
G2 = 44; % GPa
TB = 864; % N.m
TC = 754; % N.m

j1 = pi * d1^4 / 32;
j2 = pi * d2^4 / 32;


db = (TB-TC) * L1 / G1 / j1;
dc = (TC) * L2 / G2 / j2;
vpa(dc - db);

%% 5.5
L1 = 311; % mm
L2 = 330; % mm
d1 = 69; % mm
d2 = 46; % mm
G1 = 32; % GPa
G2 = 33; % GPa
TB = 626; % N.m
TC = 926; % N.m

j1 = pi * d1^4 / 32;
j2 = pi * d2^4 / 32;

vpa(TC * d2/2 / j2 * 1000);
vpa((TB - TC) * d1/2 / j1 * 1000);

%% 5.6
d = 73; % mm
TB = 1108; % N.m
TC = 552; % N.m

j1 = pi / 32 * (d^4 - (d/2)^4);
j2 = pi / 32 * d^4;

vpa(TC * d/2 / j2 * 1000);
vpa((TB - TC) * d/2 / j1 * 1000);

%% 5.7
Rb = 94; % mm
Rc = 35; % mm
ft = 0.000004; % (1/N.m)
TD = 695; % N.m

db = TD * (Rb/Rc) * ft;
dc = db * Rb / Rc;

ddc = TD * ft;
vpa(ddc + dc);

%% 5.8
Rb = 71; % mm
Rc = 36; % mm
d = 12; % mm
TD = 49; % N.m

vpa(TD * Rb/Rc * d/2 / (pi/32 * d^4) * 1000);

%% 5.9
a = 1231; % mm
b = 1509; % mm
d = 41; % mm
G = 68; % GPa
tall = 22; % MPa

syms P;
T = P * a;
eq = tall == T * d/2 / (pi/32 * d^4);
P = solve(eq, P);

vpa(P)














