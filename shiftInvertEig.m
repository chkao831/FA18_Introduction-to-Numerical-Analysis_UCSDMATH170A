function [val,vec] = shiftInvertEig(A,rho)
%Additional MATLAB Exercise, MATH 170A HW8 of Fall 2018
%Shift and Invert
%code by Chih-Hsuan Kao (c4kao@ucsd.edu)
%Date: Dec 7, 2018

    %invert and shift A by A-rho*I
    Ashift = A - rho*eye(size(A));
    %let initial guess be vector of all 1's
    q = ones(size(A,1),1);
    
    %create a matrix called iterate, which
    %stores each updated q in columns
    %the initial guess of all 1's is stored at the first column
    iterate(:,1) = q;
    
    %do 100 iterations
    for j=1:100
        
        %(A*rho*I)^(-1) * q_old = new unrescaled q
        %(A*rho*I)*new unrescaled q = q_old
        %Ashift\q_old = new unrescaled q
        q = Ashift\q;  
        
        %set the current_max as the first element
        current_max = q(1);
        %then iterate through and find max
        for k = 2:size(A,1)
            if(abs(q(k)) > abs(current_max))
                current_max = q(k);
            end
        end
        
        %at the jth iteration, 
        %each scale_factor is stored at position j+1
        scale_factor(j+1) = current_max;
        %re-scale the new q by /scale_factor
        q = q/scale_factor(j+1);
        %each new re-scaled q is stored at position j+1 column
        iterate(:,j+1) = q;
    end
    
    %finally, lambda = 1/(s(end)) + rho
    val = 1/scale_factor(end) + rho
    %the observed eigenvector is 
    vec = iterate(:,end)