
t = [1000;1050;1060;1080;1100;1130];
x = [990;1140];
A = [50*ones(6,1) t - 1065]
[Q,R] = qr(A);
R_hat = R(1:2,:);

%set_alpha
y1 = [6010;6153;6421;6399;6726;6701];
y1_hat = Q'*y1;
x1 = R_hat\y1_hat(1:2)
res1 = [y1_hat(1:2) - R_hat*x1; y1_hat(3:6)];
fprintf('The residual of the nonlinear least square problem is minimized at x1, with residual %d', res1)
scatter(t,y1)
hold on
plot(x,x1(1)*50 + x1(2)*(x-1065))


%set_beta
y2 = [9422;9300;9220;9150;9042;8800];
y2_hat = Q'*y2;
x2ㄏ = R_hat\y2_hat(1:2)
res2 = [y2_hat(1:2) - R_hat*x2; y2_hat(3:6)];
fprintf('The residual of the nonlinear least square problem is minimized at x2, with residual %d', res2)
scatter(t,y2)
hold on
plot(x,x2(1)*50 + x2(2)*(x-1065))

%graph the configuration
title('Linear least square examples for set alpha and beta')
xlabel('t-value')
ylabel('y-value')
legend({'Dataset1','Linearfit1','Dataset2','Linearfit2'},'Location','southeast')