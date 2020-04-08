clear;
close all;
clc;

%% 2.1
L = 202; % mm
a = 221; % mm
theta = 0.5; % degrees
alpha = 35; % degrees

dl = a * sind(theta) * sind(alpha);
vpa(dl/L);

%% 2.2
h = 258; % mm
a = 247; % mm
deltaC = 1.5; % mm

vpa(deltaC / 2 / h * 1000);

%% 2.3
a = 9; % in
b = 11; % in
strain = 0.004;

c = (a^2 + b^2)^0.5;
dl = strain * c / (a/c);
vpa(atand(dl/b));

%%
r = 6371
x1 = 199.6512 * sind(49.8903);
x2 = 1408.2323 * sind(61.39);
y1 = -6367.871 * sind(49.8903);
y2 = 6213.4147 * sind(61.39);
z1 = 4104.5366;
z2 = 3050.7221;

d = ((x1-x2)^2 + (y1-y2)^2 + (z1-z2)^2)^0.5;
v1 = [x1, y1, z1];
v2 = [x2, y2, z2]
cosValue = dot(v1, v2) / norm(v1) / norm(v2);
sita = acos(cosValue);
l = r*sita;

syms x3 z3;
v3 = [x3, 0, z3];
eq1 = x3^2 + z3^2 == r^2;
cv13 = dot(v1, v3) / norm(v1) / norm(v3);
cv23 = dot(v2, v3) / norm(v2) / norm(v3);
eq2 = acos(cv13) + acos(cv23) == sita;
[x3, z3] = solve([eq1, eq2], [x3, z3]);
vpa(atand(z3/x3));

nv1 = v1 / norm(v1);
nv2 = v2 / norm(v2);
syms x y z;
nv = [x, y, z];
eq1 = acos(dot(nv1, nv)) == pi/2;
eq2 = acos(dot(nv2, nv)) == sita;
[x, y, z] = solve([eq1, eq2], [x, y, z]);
vpa([x, y, z]);

f = 20*30/7/sind(75);
vpa((65.71^2 + 22.97^2)^0.5)







