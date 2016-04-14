
load face_recog_qr.mat

%%
% V is a dataset of face images. For example,
for i = 400:408
    im = V(:,i);
    im = reshape(im,192,168);
    imagesc(im)
    pause(1)
end
close all
%% query option 1:
% 805:808
% 405:408
im_id = 405:408;
query = sum(V(:,im_id),2)/numel(im_id);

%% query option 2: (saved in file)
query = reshape(query,192,168);
imagesc(query)
query = reshape(query,192*168,1);
%%
tic
r = V\query;
toc
close all
%% Is r really the solution? Let's see:
err = norm(V*r-query,2)
rank(V)



%% Let's try to get a more accurate solution via least squares:
% V was rank deficient, so we want to minimize the error
% ||q-Vr||_2
% We will do this by 2 methods, QR and SVD decompositions

%% QR
% Q, R already computed
[Q R] = qr(V);
% min ||q - Vr|| = ||q - QRr|| = ||Q'q - Rr||
% R is rank deficient, but for now let's set Rr = Q'q
% Q'b is a mat vec operation call the new vector b2 = Q'*q
%%
b2 = Q'*query;
% R is upper triangular 
Rt = R(1:size(R,2),:);
%%
% xqr = zeros(size(V,2),1);
% n = numel(b2);
% % xqr(end) = 0;
% % start solving the system: Rx = b2
% for i= 840:-1:1
%     xqr(i)=(b2(i)-R(i,1:i-1)*xqr(1:i-1))/R(i,i);
% end
xqr = backsolve_huda(Rt,b2);

%%
err2 = norm(V*xqr-query,2)
%%
% Let's visulaize the result
query = reshape(query,192,168);
[~,id1] = max(r);
sol1 = V(:,id1);
sol1 = reshape(sol1,192,168);

[~,id2] = max(xqr);
sol2 = V(:,id2);
sol2 = reshape(sol2,192,168);

subplot(1,3,1)
imagesc(query)
subplot(1,3,2)
imagesc(sol1)
subplot(1,3,3)
imagesc(sol2)

