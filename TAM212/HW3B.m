clear;
close all;
clc;

%% 250
m = 6
g = -9.8
x = 3
v = 1
vDot = 2

yd = 3 * sin(1.5 * 12);
ydd = 4.5 * cos(1.5 * 12);
rou = (1 + yd^2)^(3/2) / abs(ydd);

Et = [1/yd, 1];
et = Et / norm(Et);
En = [1, -1/yd];
en = En / norm(En);
a = 1 * et + 1 / rou * en;
F = m * (a - [0, g]);
vpa(F);

%% 816
vcyl = [0,46,7];
acyl = [-46,46,-14];

rou = norm(vcyl)^3 / norm(cross(vcyl, acyl));
vpa(rou);

%% 817
t = 2;
sd = 6 * t;
sdd = 6;
rou = 8;

a = (6^2 + (sd^2/rou)^2)^0.5;
vpa(a)

%% 914
r = [2, -3, 0];
v = [2, -3, 0];
a = [2, 0, 0];
mr = norm(v)^3 / norm(cross(v, a));
er = [3, 2, 0];
er = er / norm(er);

c = r + mr * er;
vpa(c);

%% 995
% method1
m = 4
g = -9.8
v = 1
x = 9

dt = 0.001;
v1 = func(x, v);
v2 = func(x + v1(1) * dt, v);

a = (v2 - v1) / dt;
F = m * (a - [0, g]);
vpa(F);
% methoed2
yd = 3 * 1.5 * cos(1.5 * 8);
ydd = 3 * 1.5^2 * (-sin(1.5 * 8));
rou = (1 + yd^2)^(3/2) / abs(ydd);
En = [-yd, 1];
en = En / norm(En);

a = 1 / rou * en;
F = 9 * (a + [0, 9.8]);
vpa(F)










































