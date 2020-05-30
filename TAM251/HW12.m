clear;
close all;
clc;

%% 12.1
L = 7; % m
E = 204; % GPa
Iz = 0.000055; % m^4
w = 8; % kN/m

E = E * 1e9; w = w * 1e3;

syms Ma Mc Ra Rc;
syms x;
yrc = Rc*L^3/(3*E*Iz);
ymc = Mc*L^2/(2*E*Iz);
ywb = w*(L/2)^4/(8*E*Iz);
swb = w*(L/2)^3/(6*E*Iz);
ywc = ywb + swb*(L/2);

yra = Ra*L^3/(3*E*Iz); 
yma = Ma*L^2/(2*E*Iz);
ywa = w*L^4/(8*E*Iz) - ywc;

eq1 = Ra + Rc == w * L/2;
eq2 = Ma + int(w*x, 0, L/2) == Mc + Rc * L;
eq3 = Ma + Ra * L == Mc + int(w*x, L/2, L);
eq4 = ywc == ymc + yrc;
eq5 = ywa == yma + yra;

[Ma, Mc, Ra, Rc] = solve([eq1, eq2, eq3, eq4, eq5], [Ma, Mc, Ra, Rc]);
vpa([Rc/1e3, Mc/1e3]);

%% 12.2
L = 6; % m
E = 201; % GPa
Iz = 0.000056; % m^4
w = 10; % kN/m

E = E*1e9; w = w*1e3;

ywb = 5*w*L^4/(384*E*Iz);
syms F;
yfb = F*L^3/(48*E*Iz);
F = solve(ywb == yfb, F);
vpa(F/1e3);

%% 12.3
L = 8; % m
w = 9; % kN/m

w = w*1e3;

ywb = w*(L/2)^4/(8);
swb = w*(L/2)^3/(6);
ywc = ywb + swb*(L/2);
syms F;
yfc = F*L^3/(3);
F = solve(yfc == ywc, F);
vpa(F/1e3);

%% 12.4
L = 6; % m
H = 2; % m
E = 207; % GPa
Iz = 50000000; % mm^4
w = 8; % kN/m
A = 193; % mm^2

E = E*1e9; Iz = Iz/1e12; w = w*1e3; A = A/1e6;

syms T;
ypc = T*L^3/(3*E*Iz);
dpc = T*H/A/E;
ywb = w*(L/2)^4/(8*E*Iz);
swb = w*(L/2)^3/(6*E*Iz);
ywc = ywb + swb*(L/2);
T = solve(ypc + dpc == ywc, T);
vpa(T/1e3);

%% 12.5
P = 52; % kN
L = 1987; % mm
delta = 2; % mm
E = 158; % GPa
Iz = 155981141; % mm^4

P = P*1e3; L = L/1e3; delta = delta/1e3; E = E*1e9; Iz = Iz/1e12;

ypb = P*L^3/(3*E*Iz);
spb = P*L^2/(2*E*Iz);
ypc = ypb + spb*L;
syms F;
yfc = F*(2*L)^3/(3*E*Iz);
F = solve(ypc - yfc == delta, F);
vpa(F/1e3);

%% 12.6
M = 67; % kN.m
L = 1976; % mm
del = 2; % mm
E = 155; % GPa
Iz = 144324288; % mm^4

M = M*1e3; L = L/1e3; del = del/1e3; E = E*1e9; Iz = Iz/1e12;

ymb = M*L^2/(2*E*Iz);
smb = M*L/(E*Iz);
ymc = ymb + smb*L;
syms F;
yfc = F*(2*L)^3/(3*E*Iz);
F = solve(ymc - yfc == del, F);
vpa(F/1e3);


























