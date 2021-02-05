clear all; close all; clc;

N = 10000;

X = mvnrnd([0 0], [1 .5;.5 1],N);
figure
colorForGraph = X(:,1)+X(:,2); %just for visual reference
scatter(X(:,1),X(:,2),20,colorForGraph,'filled')
axis image
title('2D Data with Correlation');
pause

[U,S,V] = svd(1/sqrt(N)*X,0);
disp(diag(S));
pause

figure
scatter(X(:,1),X(:,2),20,colorForGraph,'filled')
hold on
dir1 = V(:,1)*S(1,1);
plot([0 dir1(1)],[0 dir1(2)],'r','LineWidth',2)
dir2 = V(:,2)*S(2,2);
plot([0 dir2(1)],[0 dir2(2)],'g','LineWidth',2)
axis image
title('Directions of V with Magnitude S')
pause

figure
newData = X*V;
scatter(newData(:,1),newData(:,2),20,colorForGraph,'filled');
hold on
plot([0 S(1,1)],[0 0],'r','LineWidth',2)
plot([0 0],[0 S(2,2)],'g','LineWidth',2)
title('Renormalized Data XV')
axis image

