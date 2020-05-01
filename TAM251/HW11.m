clear;
close all;
clc;

%% 11.3
P = 7; % kN
M = 13; % kN.m
L = 7; % m
E = 189; % GPa
Iz = 0.000054; % m^4

P = P * 1e3; M = M * 1e3; E = E * 1e9;

syms x C1 C2 C3;
M1(x) = P*L-M - P * x;

y1dei(x) = int(M1, x) + C1;
C1 = solve(y1dei(0) == 0);
y1dei(x) = int(M1, x) + C1;

y1ei(x) = int(y1dei, x) + C2;
C2 = solve(y1ei(0) == 0);
y1ei(x) = int(y1dei, x) + C2;

y2dei(x) = y1dei(L);

y2ei(x) = int(y2dei, x) + C3;
C3 = solve(y2ei(L) == y1ei(L), C3);
y2ei(x) = int(y2dei, x) + C3;

vpa(y1ei / (E*Iz));
vpa(y2ei / (E*Iz));

%% 11.5
L = 5;
% let w = E = I = 1
syms x C1 C2 C3;
y1(x) = -3/16 * L^2 * x^2 + L/12 * x^3;
y1d(x) = diff(y1, x, 1);
M1(x) = diff(y1, x, 2);

V2(x) = 5 - x;

M2(x) = int(V2, x) + C1;
C1 = solve(M2(L/2) == M1(L/2), C1);
M2(x) = int(V2, x) + C1;

y2d(x) = int(M2, x) + C2;
C2 = solve(y2d(L/2) == y1d(L/2), C2);
y2d(x) = int(M2, x) + C2;

y2(x) = int(y2d, x) + C3;
C3 = solve(y2(L/2) == y1(L/2), C3);
y2(x) = int(y2d, x) + C3;

vpa(y2);

%% 11.6
P = 14; % kN
L = 5; % m
E = 208; % GPa
Iz = 0.000050; % m^4

P = P*1e3; E = E*1e9;
w = P/L;
% w
wdc = -w * L^4 / (8*E*Iz);
wsc = -w * L^3 / (6*E*Iz);
% P
pdb = P * (L/2)^3 / (3*E*Iz);
psb = P * (L/2)^2 / (2*E*Iz);
pdc = pdb + psb * L/2;
psc = psb;

vpa([(wdc + pdc)*1e3, wsc + psc]);

%% 11.7
w = 11; % kN/m
L = 6; % m
E = 177; % GPa
Iz = 0.000042; % m^4

w = w * 1e3; E = E * 1e9;
M = w * L^2 / 12;
% w deflection slope at B C
wdb = -w * (L/2)^4 / (8*E*Iz);
wsb = -w * (L/2)^3 / (6*E*Iz);
wdc = wdb + wsb * L/2;

Wdc = -w * L^4 / (8*E*Iz);
% m deflection slope at B C
mdc = -M * L^2 / (2*E*Iz);

vpa((mdc + Wdc - wdc)*1e3);

%% 11.8
P = 6; % kN
E = 168; % GPa
A = 194; % mm^2
L = 8; % m
H = 3; % m
Iz = 49000000; % mm^4

P = P*1e3; E = E*1e9; A = A/1e6; Iz = Iz/1e12;
deltac = -P/2 * H / A / E;
deltab = deltac / 2;

db = -P * L^3 / (48*E*Iz);
vpa((db + deltab)*1e3);

%% 11.9
w = 12; % kN/m
L = 5; % m
E = 218; % GPa
Iz = 0.000047; % m^4

w = w * 1e3; E = E * 1e9;
M = w * L^2 / 24;

% w deflection slope at B C
wdb = -w * (L/2)^4 / (8*E*Iz);
wsb = -w * (L/2)^3 / (6*E*Iz);
wdc = wdb + wsb * L/2;
wsc = wsb;
% m deflection slope at B C
mdc = M * L^2 / (2*E*Iz);
msc = M * L / (E*Iz);

vpa([(wdc + mdc)*1e3, wsc + msc]);







% w = w * 1e3; E = E * 1e9;
% canshu = E * Iz;
% 
% M0 = w * L^2 / 24;
% % y1(x) 0-L/2
% syms x;
% V1(x) = w * L/2 - w*x; 
% syms C1;
% M1(x) = int(V1, x) + C1;
% C1 = solve(M1(L/2) == M0, C1);
% M1(x) = int(V1, x) + C1; % y1''
% 
% y1dei(x) = int(M1, x);
% y1ei(x) = int(y1dei, x);
% % y2(x)
% M2 = M0;
% syms C2;
% y2dei(x) = int(M2, x) + C2;
% C2 = solve(y2dei*(L/2) == y1dei(L/2), C2);
% y2dei(x) = int(M2, x) + C2;
% syms C3;
% y2ei(x) = int(y2dei, x) + C3;
% C3 = solve(y2ei(L/2) == y1ei(L/2), C3);
% y2ei(x) = int(y2dei, x) + C3;
% 
% vpa(-y2ei(L) * 1e3 / canshu)
% vpa(-y2dei(L) / canshu)
% 
% 
% w = w*1e3; E = E*1e9;
% ei = E * Iz;


