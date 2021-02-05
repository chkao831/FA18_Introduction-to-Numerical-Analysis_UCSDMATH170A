function [x,r] = qrLeastSquares(A,b)

[n,m] = size(A);

[Q,R] = qr(A);

y = Q'*b;

x = R(1:m,:) \ y(1:m);  % could solve more efficiently with back sub

r = norm(y(m+1:n),2);