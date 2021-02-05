function [r,s, flops] = sparsechol(v,w,n)

r = zeros(n,1);
s = zeros(n-1,1);

flops = 0;
for i=1:n
    r(i) = v(i);  % r(i) is R(i,i) and v(i) = A(i,i)
    
    % we no longer have to do the loop becaues there's only one element
%     for k=1:i-1
%         Rii = Rii - Rki^2;
%     end
    if i>1   %have to check that i>1 because the for loop doesn't show up when i=1
        r(i) = r(i) - s(i-1)^2;  %s(i-1) is the R(i,i+1) term, or similarly R^T(i,i-1)
        flops = flops+2;
    end
    
    r(i) = sqrt(r(i));
    flops = flops+1;
    
    % we no longer have to do the loop becaues there's only one element
%     for j=i+1:n
%         Rij = Aij;
%         for k=1:i-1
%             Rij = Rij - Rki*Rkj;
%         end
%         Rij = Rij/Rii;
%     end

    if i<n  %have to check that i<n because the for loop doesn't show up when i=n
        s(i) = w(i);  % w(i) is the A(i,i+1) term
        % there is no loop here because the term Rkj for j=i+1 and k=i-1 is
        %   0, since those indices are two apart
        s(i) = s(i)/r(i);
        flops = flops+1;
    end

end