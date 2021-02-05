function [x,flops] = jacobi_solution(A,b,x,n,N)

flops = 0;
for k=1:N
    xold = x;
    x = b;
    for i=1:n
        for j=1:i-1
            x(i) = x(i) - A(i,j)*xold(j);
            flops = flops + 2;
        end
        for j=i+1:n
            x(i) = x(i) - A(i,j)*xold(j);
            flops = flops+2;
        end
        x(i) = x(i)/A(i,i);
        flops = flops+1;
    end

end