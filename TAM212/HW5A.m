clear;
close all;
clc;

%% 727
r1 = 7;
r2 = 8;
r3 = 6;
r4 = 8;
aP = 45;
omega1Mag = 2;

v1 = omega1Mag * r1;
a4_n = v1^2 / r4;
a4_t = (aP^2 - a4_n^2)^0.5;
vpa(a4_t / r3);

r1 = 8;
r2 = 6;
r3 = 8;
r4 = 6;
aP = 29;
alpha3Mag = 3;

a3_t = alpha3Mag * r3;
a2_n = (aP^2 - a3_t^2)^0.5;
v2 = (a2_n * r2)^0.5;
vpa(v2 / r1);

%% 886
r1 = 8
r2 = 8
r3 = 6
r4 = 6
omega1 = -3

vpa(omega1 * r1 / r4)














