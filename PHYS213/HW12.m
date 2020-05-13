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
m = 10 * 1e3;
P = atm;
Ti = 373.15;
L = 2230; % J/g
% 5
mv = 0.448430493273543;
n = mv/18;
V = n * R * Ti / P;
vpa(V);
% 6
dU = 1000 - P*V;
vpa(dU);

%% 3
P = 101300;
n = 1/0.018;
N = n*NA;
Lb = 2.256e6;
Tb = 373.15;
dP = P * Lb / N / (k * Tb^2);
vpa(dP)






























