function exercise2_6_6(n)
%code by Chih-Hsuan Kao (c4kao)

H=hilb(n); %make a hilbert matrix of size n
z=ones(n,1); %z be a vector whose entries are all ones
b=H*z; 
x=H\b; %solve the system Hx=b for x
condition_H=cond(H,2) %compute condition num
diff = norm(x-z,2) %compute norm of diff
residual = norm(b-(H*x),2)
end