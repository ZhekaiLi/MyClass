clear;
close all;
clc;

%% 13.1
E = 230; % MPa
L = 2831; % mm
t = 29; % mm
a = 58; % mm
b = 145; % mm

E = E*1e6; L = L/1e3; t = t/1e3; a = a/1e3; b = b/1e3;

I1 = 1/12 * t * (2*a)^3;
I2 = 1/12 * b * t^3;
Iz = I1 + 2*I2 + 2*(t*b)*(a+t/2)^2;

Pcr1 = P(L, E, Iz); % p-p
Pcr2 = P(2*L, E, Iz); % f-o
Pcr3 = P(0.7*L, E, Iz); % p-f
Pcr4 = P(0.5*L, E, Iz); % f-f

vpa([Iz*1e6, Pcr1/1e3]);
vpa([Pcr2/1e3, Pcr3/1e3, Pcr4/1e3]);


%% 13.3 plµÄ´ð°¸´íÁË
L = 1083; % mm
a = 564; % mm
b = 643; % mm
E = 185; % GPa
d = 26; % mm
theta = 63; % degrees

E = E*1e9; L = L/1e3; d = d/1e3; a = a/1e3; b = b/1e3;

I = pi/4 * (d/2)^4;
Pb = pi^2 * E * I / b^2;
F = Pb * sind(theta) * (a/L);
vpa(F/1e3);

%% 13.4
L = 2526; % mm
d = 29; % mm
E = 208; % GPa
theta = 55; % degrees

L = L/1e3; d = d/1e3; E = E*1e9; 
I = pi/4 * (d/2)^4;

syms p;
fcy = (p*(L/2) - p*tand(theta)*(L/2)) / L;
fcx = -fcy/tand(theta);
fay = -fcy - (-p);
fax = -fcx - (-p);
f = fay / sind(theta);
l = L/2 / cosd(theta);
p = solve(P(l, E, I) == f, p);
vpa(p/1e3);

%% 13.5
Pp = 574; % N
L = 1.631; % m
E = 219; % GPa
FS = 2.9;

E = E*1e9;

syms d;
I = pi/4 * (d/2)^4;
eq = Pp*FS == P(0.5*L, E, I);
d = solve(eq, d);
vpa(d);

%% 13.6 (?)
E = 195; % MPa
L = 3.497; % m
t = 38; % mm
a = 167; % mm
b = 200; % mm

E = E*1e6; t = t/1e3; a = a/1e3; b = b/1e3;

I1 = 1/12 * a * b^3;
I2 = i/12 * (a-2*t) * (b-2*t)^3;
I = I1 - I2;
Pcr = P(0.7*L, E, I);
vpa(Pcr/1e3);



%% function
% 13.2
function y = P(L, E, I)
y = pi^2 * E * I / L^2;
end




























