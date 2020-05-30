clear;
close all;
clc;

%% 10.1
sigmax = -11;
sigmay = 8;
tauxy = 11;
sigma1 = 13.034441853748634;
sigma2 = -16.034441853748632;

% 用反三角函数计算角度时应用atan2（根据坐标得出确定的角度），而不是atan（两个角度）
thetap1 = atan2d((sigma1 - sigmax),  tauxy);
% thetap1 = 0.5*atan2d( 2*tauxy, (sigmax - sigmay))

%% 10.2
sigmax = -13;
sigmay = 8;
tauxy = 8;
R = ((8 - (8 - 13)/2)^2 + 8^2)^0.5;
sigma1 = (8 - 13)/2 + R;

%% 10.3
sx = 12; 
sy = -28;
txy = 15;

smid = (sx + sy)/2;
R = ((sx - smid)^2 + txy^2)^0.5;
s1 = smid + R;
s2 = smid - R;
thetap1 = atand(txy / ((sx - sy)/2)) / 2;
R;
thetas1 = atand(-(sx - sy)/2 / txy) / 2;

x = -26.5651;
sxp = (sx + sy)/2 + (sx - sy)/2 * cosd(2*x) + txy * sind(2*x);
syp = (sx + sy)/2 - (sx - sy)/2 * cosd(2*x) - txy * sind(2*x);
txpyp = -(sx - sy)/2 * sind(2*x) + txy * cosd(2*x);


%% 10.4
p = 1272; % kPa
F = 10; % kN
t = 10; % mm
r = 150; % mm
sigmaY = 188; % MPa

p = p/1e3;
F = F*1e3;

A = pi * ((r+t)^2 - r^2);
sx = p*r/2/t + F/A;
sy = p*r/t;
s1 = sy;
s2 = sx;

thetap1 = 90;

factor = (s1^2 + s2^2 - s1*s2)^0.5;
fs = sigmaY / factor;
vpa([sx, sy, fs]);

%% 10.5
p = 1260; % kPa
T = 3; % kN.m
t = 11; % mm
r = 220; % mm
sigmaY = 221; % MPa

p = p*1e3;
T = T*1e3;
t = t/1e3;
r = r/1e3;

J = pi/2 * ((r+t)^4 - r^4);
% use MPa
sx = p*r/2/t / 1e6;
sy = p*r/t / 1e6;
txy = -T * (r+t) / J / 1e6;
smid = (sx + sy)/2;
R = ((sx - smid)^2 + txy^2)^0.5;
s1 = smid + R;
s2 = smid - R;

% 关于thetap如何选择：
% 将sx-sy直线旋转到与s1-s2重合，且sx,s1重合，所需要的最小角度的二分之一
% 例如算出thetap = 10，但是x在圆的左上角（这意味着需要顺时针旋转）,
% 因此thetap = 10 - 90 = -80
thetap1 = atand(txy / ((sx - sy)/2)) / 2;
R;
fs = sigmaY / s1;

%% 10.6
sx = -17;
sy = -26;
txy = -13;

savg = (sx + sy)/2;
R = ((sx - savg)^2 + txy^2)^0.5;

s1 = savg + R;
s2 = savg - R;
thetap1 = atand(txy / ((sx - sy)/2)) / 2;
R;

%% 10.7/8
sx = -13;
sy = -12;
txy = 29;
thetap = -23;

sxp = (sx + sy)/2 + (sx - sy)/2 * cosd(2*thetap) + txy * sind(2*thetap);
syp = (sx + sy)/2 - (sx - sy)/2 * cosd(2*thetap) - txy * sind(2*thetap);
txy = -(sx - sy)/2 * sind(2*thetap) + txy * cosd(2*thetap);

%% 10.9
t = 10;
L = 113;
P = 9;
x = 57;

t = t/1e3; L = L/1e3; x = x/1e3;
P = P*1e3;
I = 3140 * t^4;

M = 2*P*3*L - P*2*L - P*x;
sx = M * 5*t / I;
Q = 12*t * 5*t * 7.5*t - 10*t * 4*t * 7*t;
txy = -P * Q / I / (2*t);

sx = sx/1e6;
sy = 0;
txy = txy/1e6;
savg = (sx + sy)/2;
R = ((sx - savg)^2 + txy^2)^0.5;
s1 = savg + R;
s2 = savg - R;
R;
savg;
thetap1 = atand(txy / ((sx - sy)/2)) / 2;

thetas1 = atand(-(sx - sy)/2 / txy) / 2;

%% 10.10/11
sx = -27;
sy = 19;
txy = -18;

savg = (sx + sy)/2;
R = ((sx - savg)^2 + txy^2)^0.5;
s1 = savg + R;
s2 = savg - R;

vpa(s1^2 + s2^2 - s1*s2);
%
sx = -18;
sy = 28;
txy = -18;

savg = (sx + sy)/2;
R = ((sx - savg)^2 + txy^2)^0.5;
s1 = savg + R;
s2 = savg - R;

vpa(s1^2 + s2^2 - s1*s2);
%
sx = 24;
sy = 30;
txy = 24;

savg = (sx + sy)/2;
R = ((sx - savg)^2 + txy^2)^0.5;
s1 = savg + R;
s2 = savg - R;

vpa(s1^2 + s2^2 - s1*s2);

%% 10.12
% d = 60; % mm
% sigyield = 237; % MPa
% P = 137; % kN
% 
% d = d/1e3;
% sigyield = sigyield*1e6;
% P = P*1e3;
% 
% J = pi/32 * d^4;
% 
% syms T;
% sx = -P / (pi*d^2/4);
% sy = 0;
% txy = -T * d/2 / J;
% savg = (sx + sy)/2;
% R = ((sx - savg)^2 + txy^2)^0.5;
% s1 = savg + R;
% s2 = savg - R;
% eq1 = abs(s1) ==  sigyield;
% T = solve(eq1, T);
% vpa(T);
% 
% syms T;
% sx = -P / (pi*d^2/4);
% sy = 0;
% txy = -T * d/2 / J;
% savg = (sx + sy)/2;
% R = ((sx - savg)^2 + txy^2)^0.5;
% s1 = savg + R;
% s2 = savg - R;
% eq2 = abs(s2) ==  sigyield;
% T = solve(eq2, T);
% vpa(T);
% 
% syms T;
% sx = -P / (pi*d^2/4);
% sy = 0;
% txy = -T * d/2 / J;
% savg = (sx + sy)/2;
% R = ((sx - savg)^2 + txy^2)^0.5;
% s1 = savg + R;
% s2 = savg - R;
% eq3 = abs(s1-s2) ==  sigyield;
% T = solve(eq3, T);
% vpa(T);

