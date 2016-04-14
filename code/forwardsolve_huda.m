function v = forwardsolve_huda(L,y)
% input: A is an n by n square full rank lower triangular matrix
%        b is an n by 1 column vector
% output: x such that Ax = b


n = size(L,1);
% In solving a lower triangular matrix, we start by filling up the first
% element in x and then go all the way to n
v=zeros(n,1);
v(1)=y(1)/L(1,1);
for i=2:n
   v(i)=(y(i)-L(i,1:i-1)*v(1:i-1))/L(i,i);
end



end