%% 3.2
% 3
pf = 15464.04;
vi = 0.5;
vf = 0.416691724;

syms v;
p = (pf - pi)*(vi - v)/(vi - vf) + pi;
int1 = int(-p, vi, vf);

vpa(int1);

%% 5.4
% 2/3
k = 1.380649 * 1e-23;
u = 9.3 * 1e-24;
syms b;
eq = 56/44 == exp(-2*u*b / k/297.15);
b = solve(eq, b);
vpa(b);

%% 5.5
% 3
syms k;
eq = 0.5 == 2*exp(-0.1*1.60218e-19/k/1.380649e-23) / (exp(0) + 2*exp(-0.1*1.60218e-19/k/1.380649e-23));
k = solve(eq, k);
vpa(k);

%% 6.2
N = 6.022e23;
epsilon = 2.07e-21;
k = 1.380649e-23;
T = 200;

% 1
U = epsilon * exp(-epsilon/k/T) / (1 + exp(-epsilon/k/T)) * N;
vpa(U);

% 2/3/4
syms T;
U = epsilon * exp(-epsilon/k/T) / (1 + exp(-epsilon/k/T)) * N;
C = diff(U, T);

vpa(subs(C, T, 20));

%% 6.3
f = 1.7e12;
h = 6.626e-34;
epsilon = f * h;
k = 1.380649e-23;

% 1
syms T;
eq = 0.5 == exp(-epsilon/k/T);
T = solve(eq, T);
vpa(T);

% 2
T = T/10;
vpa(exp(-epsilon/k/T));

% 3
vpa(exp(-2*epsilon/k/T) / exp(-epsilon/k/T));

% 4
vpa(epsilon / (exp(epsilon/k/T) - 1) /k/T );


%% 6.4
% 1
eV = 1.6022e-19;
k = 1.380649e-23;
T = 4300;

E = 10.2 * eV;
P = 4*exp(-E/k/T) / (1 + 4*exp(-E/k/T));
vpa(P);

%% 
% syms r n N;
% d1 = r + n;
% D1 = symprod(d1, n, 1, N);
% d2 = r + 2 + n;
% D2 = symprod(d2, n, 1, N);
% f = 3^N / (D1 * D2);
% a = diff(f * (r + 2), r);
% pretty(a);





