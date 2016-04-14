function x_svd = SVDNew(A,b)

[U S V] = svd(A);

x_svd = zeros(size(A,1),1);

for i = 1:size(V,2)-10
    if S(1,1)/S(i,i) < 100000
        x_svd = x_svd + ((U(:,i)'*b)/S(i,i)) * V(:,i);
    else
        break;
    end
end

end