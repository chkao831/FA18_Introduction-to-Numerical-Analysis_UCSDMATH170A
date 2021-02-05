%This is the running script
%Run the case with n = 10 and n = 50
%with v the vector of 2’s, w and z the vector of −1’s

%code by Chih-Hsuan Kao (c4kao)

for n = [10,50]
    v = 2*ones(1,n);
    w = -ones(1,n-1);
    z = w
    [L,U1,U2]= LU_factor(n,v,w,z)
end