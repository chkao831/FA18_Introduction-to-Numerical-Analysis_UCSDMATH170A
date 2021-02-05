function [Udiag,Uoffdiag,Loffdiag] = bandedLU(v,w,n)

    Udiag = v;
    Uoffdiag = w;
    Loffdiag = zeros(n-1,1);
    
    % only need to compute up to row n-1 because last row isn't used to
    % reduce any other rows
    for i=1:n-1
        %multiplier: only need to eliminte next row because all other
        %elements in column are 0
        Loffdiag(i) = Uoffdiag(i)/Udiag(i); 
        
        %row reduction: only need to compute this term because everything
        %else in row i after column i+1 are zeros.
        Udiag(i+1) = Udiag(i+1) - Loffdiag(i)*Uoffdiag(i); 
    end