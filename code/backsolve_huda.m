function x = backsolve_huda(A,b)
% input: A is an n by n square full rank upper triangular matrix
%        b is an n by 1 column vector
% output: x such that Ax = b

% obtain the number of rows/cols in A
n = size(A,1); 
x=zeros(n,1); 

% obtain the nth entry in x which is expressed by the formula below
x(n)=b(n)/A(n,n);

% start going upwards in the matrix 
% in general, x(i) = b(i) - A(i,i+1:n)*x(i+1:n))/A(i,i)
% and this is why we start with the loop from n-1 and then go backwards
for i=n-1:-1:1
   x(i)=(b(i)-A(i,i+1:n)*x(i+1:n))/A(i,i);
end


end