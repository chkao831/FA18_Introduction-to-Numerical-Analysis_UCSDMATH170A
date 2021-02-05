n = 6
m = 3
A = randn(n,m)
[Q,R] = qr(A)
Q' * Q
norm(eye(n) - Q'*Q)
norm(A-Q*R)