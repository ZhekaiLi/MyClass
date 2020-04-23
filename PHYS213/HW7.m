clear;
close all;
clc;

%% 1
Qh = 530;
Th = 48 + 273.15;
Tc = -16 + 273.15;

Qc = Qh - Qh * (1 - Tc/Th);
vpa(Qc)

%% 2
Pi = 100e3;
Ti = 300;
Vi = 0.01;
Vf = 0.03;
nR = Pi * Vi / Ti;
% 1
dS1 = nR * log(Vf/Vi);
vpa(dS1);
% 2
% P = nRT/V，代入PV^gamma=constant中得T-V关系式
syms Tf;
eq = Tf / Ti == (Vi / Vf)^(2/3);
Tf = solve(eq, Tf);
vpa(Tf);
% 3
dS2 = 3/2 * nR * log(Tf/Ti);
vpa(dS2);
% 4
vpa(dS1 + dS2);

%% 3
Th = 400 + 273.15;
Tc = 30 + 273.15;
epsilon = 0.25;

Qh2 = 1;
syms Qh1;
Wby = Qh1 * (1 - Tc/Th);
eq = epsilon == Wby / (Qh1 + Qh2);
Qh1 = solve(eq, Qh1);
vpa(Qh1);

%% 4
Tc = 300;
Th = 340;
Cv = 33;

syms T;
int1 = int(Cv * (1 - Tc/T), T, Th, Tc);
vpa(int1 / (Cv * (Th - Tc)))








