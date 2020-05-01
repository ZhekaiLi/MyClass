clear;
close all;
clc;

k = 1.38e-23;
NA = 6.02e23;
atm = 101325;
%% 3
V = 300;
N = 1e4 * NA;
P = N * k * (293) / V;
vpa(P/atm);

U = 3/2 * 9e3*NA * k * 10 + 5/2 * 1e3*NA * k * 10;
vpa(U);

%% 6
T = 250;
E = 1.6e-21;

P = (2 * exp(-E/k/T)) / (2 * exp(-E/k/T) + 1);
EE = E * P;
vpa(EE);

%% 7
T = 290;
syms V;
P = 2 * 8.3145 * T / V;
int1 = int(P, 2, 1);
vpa(int1);

%% 8
vpa(sqrt(3*56/40));

%% 9
n = 500 / 107;
N = n * NA;
C = 3 * N * k;
vpa(300/C);

%% 11
syms T;
eq = 0.3 * 386 * T == (117 - T) * 1.5 * 12.5;
T = solve(eq, T);
vpa(T);

%% 12
dE = 1.1e-21;
p1 = 1;
p2 = exp(-dE/k/242);
vpa(p2 / (p1+p2));


%3
P = 4 * NA * k * 293 / (1e-3);
vpa(P/atm);
%4
C1 = 5/2 * NA * k;
C2 = 3/2 * 3*NA * k;
vpa(10 * (C1+C2));
%5
syms T;
C = 3e-4 * T^3;
U = int(C, 0, 100);
vpa(U);
%7
N = 2*atm * 0.1 / k / 300;
C = 5/2 * N * k;
vpa(C * 4);
%8
V = 2.4e24 * k * 250 / (1.5*atm);
vpa(V * 1e3);
%10
n = 3000/207.2;
N = n*NA;
C = 3 * N * k;
vpa(C);
%13
n = 400/187;
P = n*NA * k * 300 / (1/2*1e-3);
vpa(P/atm);
%14
dU = 1 * 9.81 * 1.5;
n = 1000/27;
N = n*NA;
dT = dU / 3 / N / k;
vpa(dT);
%15
E = 0.51e-20;
Te = 245;
vpa(exp(-3*E/k/Te));
%21
ratio = exp(-4.65e-26*9.81*500/k/300);
vpa(ratio)

 

