clear;
close all;
clc;

%% 151
a = [-1,-4];
bLength = 3;

sita1 = atan(a(2) / a(1));
sita2 = sita1 + 2*pi/3;
vpa(bLength * [cos(sita2), sin(sita2)]);

%% 582
omega = 4;
r = [3,2];

vw = [0, 0, omega];
vr = [r(1), r(2), 0];
cross(vw, cross(vw, vr));

%% 970
% 这题比较特殊，直接解ruv0 == ruv因为精度关系会解不出
% 因此只能这么写了，即通过找x1、x2的中相同的解来求x
rij = [-1.7359610329265556,-3.6297190725875423];
ruv = [-2.9916440230224497,-2.6904436982139677];

syms x;
R = [cos(x), sin(x);
    -sin(x), cos(x)];
ruv0 = R * rij';
eq1 = ruv0(1) == ruv(1);
eq2 = ruv0(2) == ruv(2);
x1 = solve(eq1, x);
x2 = solve(eq2, x);
vpa(x1)
vpa(x2)







