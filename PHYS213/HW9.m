clear;
close all;
clc;

k = 1.38e-23;
NA = 6.02e23;
atm = 101325;
%% 1
C = 1.1;
Tb = 263.15;
Te = 283.15;

delta_T = Te - Tb;
delta_S = C * log(Te/Tb);
delta_U = C * delta_T;
delta_F = delta_U - Te * delta_S;
W = -delta_F;
vpa(W);

%% 2
Na = 1;
Nb = 2;
b = 2e-4;

syms Va;
eq = Na * k / (Va - b*Na) == Nb * k / (1 - Va);
Va = solve(eq, Va);
vpa(Va);

%% 3
Te = 280;
Va = 2;
na = 1.2;
Vb = 3.5;

delta_S = NA * na * k * log((Va + Vb)/Va);
W = Te * delta_S;
vpa(W);

