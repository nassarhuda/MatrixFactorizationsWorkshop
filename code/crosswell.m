clear all;
load crosswell.mat
I = eye(256);
B = G' * d;
alfa = 10;

A = G'*G + alfa^2 * I;
x = A\B;

X = linspace(0, 1600, 16);
Y = X;
[a b]= meshgrid(X, Y);
z = reshape(x, 16, 16);
figure
pcolor(a, b, z)
colorbar

x_svd = SVDnew(G,d);%this function calculates x using the derived formula
z_svd = reshape(x_svd, 16, 16);
figure
pcolor(a, b, z_svd)
colorbar

x = G\d;
z = reshape(x, 16, 16);
figure
pcolor(a,b,z)
colorbar
