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


% %% 816
% vcyl = [0,46,7];
% acyl = [-46,46,-14];
% 
% rou = norm(vcyl)^3 / norm(cross(vcyl, acyl));
% vpa(rou);
% 
% %% 941
% r = [2, -3, 0];
% v = [2, -3, 0];
% a = [2, 0, 0];
% mr = norm(v)^3 / norm(cross(v, a));
% er = [3, 2, 0];
% er = er / norm(er);
% 
% c = r + mr * er;
% vpa(c);
% 
% %% 995
% m = 4
% g = -9.8
% v = 1
% x = 9
% 
% dt = 0.001;
% v1 = func(x, v);
% v2 = func(x + v1(1) * dt, v);
% 
% a = (v2 - v1) / dt;
% F = m * (a - [0, g]);
% vpa(F);

at = 2 / 8;
syms an;
eq1 = tan(0.5) == an / at;
an = solve(eq1, an);
vpa((an^2 + at^2)^0.5)

function [V] = func(x, v)
slope = 3 * cos(1.5 * x);

syms vx vy;
eq1 = vy / vx == slope;
eq2 = vx^2 + vy^2 == v^2;
[vx, vy] = solve([eq1, eq2], [vx, vy]);

if vx(1) <= 0
    vx1 = vx(1)
else
    vx1 = vx(2)
end
if vy(1) >= 0
    vy1 = vy(1)
else
    vy1 = vy(2)
end

V = [vx1, vy1]
end






































