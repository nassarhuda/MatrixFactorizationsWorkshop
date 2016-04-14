% Create a random set of coordinates in a circle.
% First define parameters that define the number of points and the circle.
n = 10000;
R = 50;
x0 = 0;
y0 = 0;
% we want to plot n points in a circle located at origin (x0,y0)
% of radius R

t = 2*pi*rand(n,1); %decide on the angles
a = 0;
b = R;
r = a + (b-a).*rand(n,1); %decide on the radius
x = x0 + r.*cos(t);
y = y0 + r.*sin(t);

% create a landmark
x_landmark = [0:0.5:R]';
y_landmark = zeros(length(x_landmark),1);
n_landmark = length(x_landmark);

x = [x;x_landmark];
y = [y;y_landmark];
% plot the points
subplot(2,2,1)
plot(x(1:n),y(1:n), '.', 'MarkerSize', 15)
hold on
plot(x(n+1:n+n_landmark),y(n+1:n+n_landmark),'r.', 'MarkerSize', 15)
axis square;
grid on;
title('initial plot')
%%
M = rand(2,2);
[U,S,V] = svd(M);
XY = [x';y'];
% apply V
XY_V = V'*XY;
% plot the points
subplot(2,2,2)
plot(XY_V(1,1:n),XY_V(2,1:n), '.', 'MarkerSize', 15)
hold on
plot(XY_V(1,n+1:n+n_landmark),XY_V(2,n+1:n+n_landmark),'r.', 'MarkerSize', 15)
axis square;
grid on;
title('After applying V^{T}')
% apply S
XY_VS = S*XY_V;
% plot the points
subplot(2,2,3)
plot(XY_VS(1,1:n),XY_VS(2,1:n), '.', 'MarkerSize', 15)
hold on
plot(XY_VS(1,n+1:n+n_landmark),XY_VS(2,n+1:n+n_landmark),'r.', 'MarkerSize', 15)
axis square;
grid on;
title('After applying \Sigma V^{T}')
% apply U
XY_VSU = U*XY_VS;
% plot the points
subplot(2,2,4)
plot(XY_VSU(1,1:n),XY_VSU(2,1:n), '.', 'MarkerSize', 15)
hold on
plot(XY_VSU(1,n+1:n+n_landmark),XY_VSU(2,n+1:n+n_landmark),'r.', 'MarkerSize', 15)
axis square;
grid on;
title('After applying U \Sigma V^{T}')

%%
% Draw the best rank 1 approximation: line in this case:
App = U(:,1)*S(1,1)*V(:,1)';
XY_App = App*XY;
plot(XY_App(1,:),XY_App(2,:), 'g.', 'MarkerSize', 15)

hold on

App2 = U(:,2)*S(2,2)*V(:,2)';
XY_App2 = App2*XY;
plot(XY_App2(1,:),XY_App2(2,:), 'c.', 'MarkerSize', 15)