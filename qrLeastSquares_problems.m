%% part a
t = [-1 -.75 -.5 0 .25 .5 .75]';
y = [1 .8125 .75 1 1.325 1.75 2.3125]';

A = [ones(length(t),1) t t.^2];

[x,r] = qrLeastSquares(A,y);


%% part b
t = [1000 1050 1060 1080 1110 1130]';
alpha = [6010 6153 6421 6399 6726 6701]';
beta = [9422 9300 9220 9150 9042 8800]';

A = [50*ones(length(t),1) t-1065];

[x1,r1] = qrLeastSquares(A,alpha);
[x2,r2] = qrLeastSquares(A,beta);

figure
hold on
plot(t,alpha,'ro')
plot(t,beta,'bo')
plot(t,A*x1,'r')
plot(t,A*x2,'b')