clear;
close all;
clc;

%% 177
rP = [-4,6];
rQ = [-5,-4];
vP = [-4,-1];
vQ = [-1,1];

syms x;
xrP = vP * x + rP;
xrQ = vQ * x + rQ;
xrPQ = xrP - xrQ;
rPQ(x) = (xrPQ(1)^2 + xrPQ(2)^2)^0.5;

f(x) = diff(rPQ(x));
vpa(f(0));

%% 391 459 505 686
% pass

%% 756
avec = [2,-5]
adotvec = [-3,-1]

syms t;
ra = adotvec * t + avec;
fra(t) = (ra(1)^2 + ra(2)^2)^0.5;
%ff(t) = dot(ra, ra) / fra;
f(t) = diff(ra);
vpa(f(0))




