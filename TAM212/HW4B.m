clear;
close all;
clc;

%% 106
rAB = [2,0]
rAD = [0,1]
rBC = [1,2]
rDC = [3,1]
omega2 = -3
 
rAB = [rAB(1), rAB(2), 0]; rAD = [rAD(1), rAD(2), 0];
rBC = [rBC(1), rBC(2), 0]; rDC = [rDC(1), rDC(2), 0];
omega1 = [0, 0, omega1];

syms omega2z omega3z;
omega2 = [0, 0, omega2z];
omega3 = [0, 0, omega3z];
vd = cross(omega1, rAD);
eq = vd + cross(omega3, rDC) == cross(omega2, rBC);
[omega2z omega3z] = solve(eq, [omega2z omega3z]);
vpa(omega2z)

%% 486
rOP = [-2,1];
rPQ = [1,-2];
omega1 = 3;
omega2 = 2;
alpha1 = -1;
alpha2 = 3;

rOP = [rOP(1), rOP(2), 0]; rPQ = [rPQ(1), rPQ(2), 0];
omega1 = [0, 0, omega1]; omega2 = [0, 0, omega2];
alpha1 = [0, 0, alpha1]; alpha2 = [0, 0, alpha2];

ap = [0, 0, 0] + cross(alpha1, rOP) + cross(omega1, cross(omega1, rOP));
aq = ap + cross(alpha2, rPQ) + cross(omega2, cross(omega2, rPQ));

vpa(aq);

%% 523
l = 5;
aP = 2;
thetaP = 42;
aQ = 2.5;
thetaQ = 99;

rPQ = [0, l, 0];
aP = aP * [-sind(thetaP), cosd(thetaP), 0];
aQ = aQ * [sind(thetaQ), -cosd(thetaQ), 0];

syms omegaz alphaz;
omega = [0, 0, omegaz];
alpha = [0, 0, alphaz];
eq = aQ == aP + cross(alpha, rPQ) + cross(omega, cross(omega, rPQ));
[omegaz, alphaz] = solve(eq, [omegaz, alphaz]);
vpa(omegaz);































