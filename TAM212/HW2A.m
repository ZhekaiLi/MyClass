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
avec = [4,3,0];
adotvec = [2,4,0];

syms t;
va = adotvec * t + avec;
% % 1
% f = (va(1)^2 + va(2)^2)^0.5;
% df = diff(f, t);
% vpa(subs(df, t, 0))

% 2
dva = diff(va, t);
vpa(subs(dva, t, 0))





