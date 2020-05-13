clear;
close all;
clc;

%% 13.1
E = 119; % MPa
L = 1669; % mm
t = 22; % mm
a = 66; % mm
b = 110; % mm

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


%% 13.3
L = 1039; % mm
a = 547; % mm
b = 597; % mm
E = 192; % GPa
d = 30; % mm
theta = 48; % degrees

E = E*1e9; L = L/1e3; d = d/1e3; a = a/1e3; b = b/1e3;

I = pi/4 * (d/2)^4;
Pb = pi^2 * E * I / (b)^2;
F = Pb * sind(theta) * (a/L);
vpa(F/1e3);

%% 13.6
E = 192; % MPa
L = 4.946; % m
t = 27; % mm
a = 140; % mm
b = 224; % mm

E = E*1e6; L = L; t = t/1e3; a = a/1e3; b = b/1e3;

I1 = 1/12 * a * b^3;
I2 = i/12 * (a-2*t) * (b-2*t)^3;
I = I1 - I2;
Pcr = P(2*L, E, Iz);
vpa(Pcr/1e3)



%% function
% 13.2
function y = P(L, E, I)
y = pi^2 * E * I / L^2;
end







% %% 1
% rAB = [2,0,0];
% rAD = [0,1,0];
% rBC = [1,2,0];
% rDC = [3,1,0];
% omega3 = -1;
% 
% syms omega1 omega2;
% omg1 = [0, 0, omega1];
% omg2 = [0, 0, omega2];
% omg3 = [0, 0, omega3];
% vD = cross(omg1, rAD);
% vC1 = vD + cross(omg3, rDC);
% vC2 = cross(omg2, rBC);
% [omega1 omega2] = solve(vC1 == vC2, [omega1 omega2]);
% vpa(omega1);
% 
% %% 2
% rOP = [2,3,0];
% rPQ = [2,-2,0];
% omega1 = -1;
% omega2 = 3;
% alpha1 = -1;
% alpha2 = 3;
% 
% omg1 = [0, 0, omega1];
% omg2 = [0, 0, omega2];
% alf1 = [0, 0, alpha1];
% alf2 = [0, 0, alpha2];
% 
% aP = cross(alf1, rOP) + cross(omg1, cross(omg1, rOP));
% aQ = aP + cross(alf2, rPQ) + cross(omg2, cross(omg2, rPQ));
% vpa(aQ);
% 
% %% 3
% omega = -1;
% alpha = 2;
% rPQ = [-2,0,0];
% aP = [3,1,0];
% 
% omg = [0, 0, omega];
% alf = [0, 0, alpha];
% aQ = aP + cross(alf, rPQ) + cross(omg, cross(omg, rPQ));
% vpa(aQ);
% 
% %% 4
% rPA = [-3,3,0];
% rQA = [-1,-3,0];
% vP = [-1,3,0];
% vQ = [1,-1,0];
% 
% syms omega1 omega2;
% omg1 = [0, 0, omega1];
% omg2 = [0, 0, omega2];
% vA1 = vQ + cross(omg1, rQA);
% vA2 = vP + cross(omg2, rPA);
% [omega1 omega2] = solve(vA1 == vA2, [omega1 omega2]);
% omg1 = [0, 0, omega1];
% vA1 = vQ + cross(omg1, rQA);
% vpa(vA1);
% 
% %% 5
% rOP = [-1,-2,0];
% rPQ = [-8,1,0];
% omega1 = -8;
% omega2 = 1;
% vP = [-16,8,0];
% vQ = [-17,0,0];
% alpha2 = -2;
% 
% omg1 = [0, 0, omega1];
% omg2 = [0, 0, omega2];
% alf2 = [0, 0, alpha2];
% 
% syms alpha1;
% alf1 = [0, 0, alpha1];
% aP = cross(alf1, rOP) + cross(omg1, cross(omg1, rOP));
% aQ = aP + cross(alf2, rPQ) + cross(omg2, cross(omg2, rPQ));
% alpha1 = solve(aQ(2) == 0, alpha1);
% alf1 = [0, 0, alpha1];
% aP = cross(alf1, rOP) + cross(omg1, cross(omg1, rOP));
% vpa(aP);
% 
% %% 6
% l = 6;
% aP = 2.5;
% thetaP = 67;
% aQ = 3;
% thetaQ = 82;
% 
% aP = aP * [-cosd(thetaP), -sind(thetaP), 0];
% aQ = aQ * [cosd(thetaQ), sind(thetaQ), 0];
% rQP = [l, 0, 0];
% 
% syms omega alpha;
% omg = [0, 0, omega];
% alf = [0, 0, alpha];
% aP1 = aQ + cross(alf, rQP) + cross(omg, cross(omg, rQP));
% [omega alpha] = solve(aP1 == aP, [omega alpha]);
% vpa(omega)





























