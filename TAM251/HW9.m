clear;
close all;
clc;

%% 9.1
a = 673; % mm
L = 2958; % mm
P = 1332; % N
theta = 55; % degrees
b = 1183; % mm

Vy = P * sind(theta);
Fx = -P * cosd(theta);
Mz = -(Vy * (L - b) + (-Fx * a));
vpa([Vy, Fx, Mz/1e6]);

%% 9.2
a = 651; 
b = 880;
L = 2932;
do = 90;
di = 50;
P = 961; 
theta = 47; 

N = -P * cosd(theta);
V = P * sind(theta);
M = P*sind(theta) * (L-b) + P*cosd(theta) * a;
I = pi/64 * (do^4 - di^4);
Q = (pi/8 * do^2) * (2*do/3/pi) - (pi/8 * di^2) * (2*di/3/pi);
t = do - di;

sigmax = N / (pi/4 * (do^2 - di^2));
taoxy = V * Q / I / t;
vpa([sigmax*1e3, -taoxy*1e3]);

%% 9.3
a = 647; 
b = 1482;
L = 2963;
do = 93;
di = 53;
P = 892; 
theta = 41; 

Fx = P * cosd(theta);
Fy = P * sind(theta);
I = pi/64 * (do^4 - di^4);
A = pi/4 * (do^2 - di^2);
Mz = P*sind(theta) * (L-b) + P*cosd(theta) * a;

sigma_x1 = -Fx / A;
sigma_x2 = -Mz * (do/2) / I;
vpa(sigma_x1 + sigma_x2)

%% 9.4
a = 374; % mm
b = 206; % mm
c = 253; % mm
Pz = 411; % N
Py = 403; % N

T = Py * b + Pz * c;
My = Pz * a;
Mz = Py * a;
vpa([-T/1e3, -My/1e3, -Mz/1e3]);

ws = 0.085/0.034 * 7.54;

%% 9.5
a = 332; 
b = 249;
c = 276;
Pz = 401; 
Py = 340; 
p = 725;
do = 84;
di = 64;

p = p * 1e-3; %转换成MPa

I = pi/64 * (do^4 - di^4);
J = pi/32 * (do^4 - di^4);

T = Py * b + Pz * c;
My = Pz * a;
Mz = Py * a;

% F
Q = 1/12 * (do^3 - di^3);
tau_xy1 = -Py * Q / I / (do - di);
% T
tau_xy2 = T * do/2 / J;
% M
sigma_x = -My * do/2 / I;
% p
sigma_long = p * di / 4 / ((do - di)/2);
sigma_hoop = p * di / 2 / ((do - di)/2);

tau_xy = tau_xy2 + tau_xy1;
vpa([sigma_x+sigma_long, sigma_hoop, tau_xy]);

%% 9.6
a = 341; 
b = 235;
c = 276;
Pz = 482; 
Py = 458; 
p = 658;
do = 91;
di = 51;

p = p * 1e-3; %转换成MPa

I = pi/64 * (do^4 - di^4);
J = pi/32 * (do^4 - di^4);

T = Py * b + Pz * c;
My = Pz * a;
Mz = Py * a;

% F
Q = 1/12 * (do^3 - di^3);
tau_xz1 = Pz * Q / I / (do - di);
% T
tau_xz2 = -T * do/2 / J;
% M
sigma_x = Mz * do/2 / I;
% p
sigma_long = p * di / 4 / ((do - di)/2);
sigma_hoop = p * di / 2 / ((do - di)/2);

tau_xz = tau_xz2 + tau_xz1;
vpa([sigma_x+sigma_long, sigma_hoop, tau_xz]);









