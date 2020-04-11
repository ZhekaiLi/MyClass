clear;
close all;
clc;

%% 274
theta = 45;
rOQ = [-3,1];
rQP = [5,2];
i = [-1/2^0.5, 1/2^0.5];
j = [-1/2^0.5, -1/2^0.5];
oq = rOQ(1)*i + rOQ(2)*j; 
qp = rQP(1)*i + rQP(2)*j; 
vpa(oq + qp);

%% 304
% skip

%% 320
theta = 60;
rij = [3,-3];
i = [cosd(theta), -sind(theta)];
j = [sind(theta), cosd(theta)];
vpa(rij(1)*i + rij(2)*j);

%% 321
% skip

%% 428
x = -6;
y = -7;
v = [2,-6];
r = [x, y];
er = r / norm(r);
eo = [er(2), -er(1)];
vpa(er * dot(v, er))

%% 627
a = [1,-2];
cDotA = 7;
cDotB = -3;
b = [-a(2), a(1)];
syms cx cy;
eq1 = dot([cx, cy], a) == cDotA;
eq2 = dot([cx, cy], b) == cDotB;
[cx, cy] = solve([eq1, eq2], [cx, cy]);
vpa([cx, cy]);
