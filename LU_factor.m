function[L,U1,U2]= LU_factor(n,v,w,z)
%input: n(size of the square tridiagonal matrix); 
%       v(n*1 vector, main diagonal); 
%       w((n-1)*1 vector, upper diag);
%       z((n-1)*1 vector, lower diag)
%output: L((n-1)*1 vector that represents nontrivial diagonal of L)
%        U1(n*1 vector that represents main diagonal of U)
%        U2((n-1)*1 vector that represents non-trivial upper diag of U)

%code by Chih-Hsuan Kao (c4kao)

    U2 = w; % Upper diag of U is same as w
    U1(1) = v(1); % first element in diag of U is same as v(1)
    %now first row is all done, starts from second row (i=2)
    for i = 2:n % for the computation of elements 2 to n
        %compute lower diag element
        L(i-1) = z(i-1)/U1(i-1); 
        %compute ith element of upper's main diagonal
        U1(i) = v(i)-L(i-1)*U2(i-1); 
    end
end

