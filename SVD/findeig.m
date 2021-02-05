function [vector, value] = findeig(A,maxiter)
n = length(A);
vector = rand(n,1);

for i=1:maxiter
    vector = A*vector;
    
%     [val,ind] = max(abs(vector));
    
    value = vector(1);
    for j=2:n
        if abs(vector(j)) > abs(value)
            value = vector(j);
        end
    end
    
    vector = vector/value;
end