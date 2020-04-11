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
rij = [2.798301086621326,-2.878645866357132];
ruv = [0.3234857070633068,4.001555696551886];

syms x;
i = [cos(pi+x), -sin(pi+x)];
j = [sin(pi+x), cos(pi+x)];
eq = rij(1) * i + rij(2) * j == ruv;
[x] = solve(eq, x);
vpa(x)

sita1 = pi + atan(rij(1) / rij(2));
sita2 = atan(ruv(1) / ruv(2));
vpa(2*pi - sita1 + sita2)







