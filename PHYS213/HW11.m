clear;
close all;
clc;

k = 1.38064852e-23; % J/K
NA = 6.02e23;
atm = 101325;
R = 8.3145;
eV = 1.60218e-19; % J
keV = 8.61733034e-5; % eV/K

%% 2
P = 1e6;
T = 300;
n = 1;
% 2
V = n*R*T / P;
vpa(V);
% 3
% dS/dV = Nk / (V - Nb)
% G = U + PV - TS
% dG/dV = 0 + P - T(dS/dV) = P - TNk / (V - Nb);
b = 1.1e-28;
N = n * NA;
syms V;
eq = P - T*N*k / (V - N*b) == 0;
V = solve(eq, V);
vpa(V);

%% 3
n = 1;
N = n * NA;
Pi = 4e5;
T = 300;
% 1
% G = U - TS + PV
Pf = 2e5;
Vi = N*k*T / Pi;
Vf = N*k*T / Pf;
dTS = T*N*k * log(Vi/Vf);
vpa(dTS);
% 2
% F = U - TS
du = T*k * log(Vi/Vf);
vpa(du);
% 3
b = 1.8e-28;
dG = T*N*k * log((Vi-N*b) / (Vf-N*b));
vpa(dG);
% 4
du = T*k * log((Vi-N*b) / (Vf-N*b));
vpa(du);












