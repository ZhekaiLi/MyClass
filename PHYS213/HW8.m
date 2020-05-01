clear;
close all;
clc;

%% 1
Th = 47 + 273;
Tc = -22 + 273;
W = 900;

cof = 1 / (Th/Tc - 1);
Qc = W * cof;
vpa(Qc);

%% 2
k = 1.380649e-23;
b = 5e-29;
T = 300;
n = 3;
NA = 6.02e23;
N = n * NA;
Vi = 0.001;
Vf = 0.002;

%------------------------------1,2
syms Pi;
eq = Pi * (Vi - N * b) == N * k * T;
Pi = solve(eq, Pi);
syms Pf;
eq = Pf * (Vf - N * b) == N * k * T;
Pf = solve(eq, Pf);
%------------------------------3
syms V;
P = N * k * T / (V - N * b);
int1 = int(P, Vi, Vf);
vpa(int1);

%% 3
m = 107;
T = 373.15;
P = 101325;

n = m / 18;
N = n * NA;
Vf = N * k * T / P;
W = Vf * P;
vpa(W);

%% 4
k = 1.380649e-23;
Vi = 1e-3;
Pi = 1e4;
T = 32 + 273;

N = Pi * Vi / k / T;

Vf = 4e-3;
syms V;
P = N * k * T / V;
int1 = int(P, Vi, Vf);
vpa(int1);






