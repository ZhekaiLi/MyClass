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

%% 391 459 686
% pass

%% 505
theta = 3;
omega = -4;

syms t sita;
fsita = omega * t + theta;
fr = 3 - sin(4 * fsita + 3);

dfr = diff(fr, t);
dfsita = diff(fsita, t);

er = [cos(theta), sin(theta)];
esita = [-sin(theta), cos(theta)];

v = subs(dfr, t, 0) * er + subs(fr, t, 0) * subs(dfsita, t, 0) * esita;
vpa(v);

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





