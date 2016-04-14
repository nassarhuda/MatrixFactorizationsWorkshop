clear all;
close all;
IMG = imread('khiam1.jpg');
IMG = IMG(:,:,1);
IMG = double(IMG);
imagesc(IMG)
colormap gray
%%
[U,S,V] = svd(IMG);
%%
B = U(:,1)*S(1,1)*V(:,1)';
figure
imagesc(B)
colormap gray
%% how many do we need?
% Let's see the singular values?
plot(diag(S))
%% Let's take just the top 100
k = 50;
B = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
figure
imagesc(B)
colormap gray
%%
DIFF = IMG-B;
figure
imagesc(DIFF)
colormap gray
