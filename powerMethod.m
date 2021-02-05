%% Part a

A = [1 1 1;-1 9 2;0 -1 2];

q = ones(3,1);

iterate(:,1) = q;
for j=1:10
    q = A*q;
    [bgst,index] = max(abs(q));
    scale_factor(j+1) = q(index(1));
    q = q/scale_factor(j+1);
    iterate(:,j+1) = q;
end
iterate
scale_factor


%% Part b

[V,D] = eig(A);
D = diag(D);
[bgst,index] = max(abs(D));
largeEig = D(index(1))


%% Part c
v = V(:,index(1));
[bgst,ind] = max(abs(v));
v = v/v(ind(1));

for j=1:10
    err(j) = norm(iterate(:,j+1) - v) / norm(iterate(:,j) - v);
end


%% Part d
val=sort(abs(D),'descend');
ratio = val(2)/val(1);

figure
plot(err);
hold on
plot(ratio*ones(1,length(iterate)))