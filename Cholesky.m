function[r,s] = Cholesky(v,w)
temp = size(v);
n = temp(1);
flops = 0;
r = zeros(n,1);
s = zeros(n-1,1);

fprintf('Result when n = %d:\n',n);

%Compute r(1) and s(1)
if v(1) <= 0 
    fprintf('A is not positive definite.\n');
else
    r(1) = sqrt(v(1));
    s(1) = w(1)/r(1)
    flops = flops + 3
    %compute r2 - r(n-1) and s2 - s(n-1)
    for i = 2:(n-1)
        if v(i) - s(i-1)^2 <= 0 
            fprintf('A is not positive definite.\n')
            break
        else
            r(i) = sqrt(v(i) - s(i-1)^2);
            s(i) = w(i)/r(i);
            flops = flops + 5;
        end
    end
    
    %Compute r(n)
    if v(n) - s(n-1)^2 <= 0 
        fprintf('A is not positive definite.\n')
    else
        r(n) = sqrt(v(n) - s(n-1)^2);
        flops = flops + 4;
    end
end

fprintf('The exact total flops is %d, including: \n', flops);
fprintf('%d flops on comparison (positive definite), %d on sqrt and %d on divisions \n\n', n, n, n-1);

end