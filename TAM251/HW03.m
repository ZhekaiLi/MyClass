clear;
close all;
clc;

%% 3.7
Lo = 200; % mm
d = 30; % mm
P = 122; % kN
delta = 0.1; % mm
sy = 350; % MPa
G = 147; % GPa

E = P / (pi * d^2 / 4) / (delta / Lo);
v = E / 2 / G - 1;
dd = -v * delta / Lo * d;
vpa([E, v, dd]);

%% 3.8 ???
G = 8000; % ksi
P = 761; % kips
Lo = 15; % in
b = 6; % in
t = 1; % in

stress = P / (Lo * b);
strain = stress / G;
vpa([stress, strain]);

%% 3.9
P = 1; % kN
a = 697; % mm
b = 671; % mm
L = 1053; % mm
E = 172; % GPa
Ac = 821; % mm^2
theta = 57; % degrees

F = P * L / (sind(theta) * a);
stress = F / Ac;
strain = stress / E;
d = strain * b;
ans = d / sind(theta) * L / a;
vpa(ans);

%% 3.10
L = 2907; % mm
Ac = 2735; % mm^2
E = 217; % GPa
P = 592; % kN
theta = 56; % degrees

fc = (P * tand(theta) * L/2 + P * L/2) / L;
f = fc / tand(theta);
stress = f / Ac;
d = stress / E * L;
vpa(d)

%% 3.11
% pass





