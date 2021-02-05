clear all; close all; clc;

I = double(imread('cameraman.tif'));
N = size(I,1);
figure
imagesc(I)
axis image
colormap pink
pause

[U,S,V] = svd(I);

figure
plot(diag(S),'LineWidth',2)
title('Singular Values')
xlabel('i');
ylabel('\sigma_i');
pause

for i=2:log2(N)
    numKept = 2^i;
    Itmp = U(:,1:numKept)*S(1:numKept,1:numKept)*V(:,1:numKept)';
    imagesc(Itmp)
    axis image
    colormap pink
    title([num2str(numKept) ' Singular Vectors']);
    pause
end

numKept = 1;
Itmp = U(:,1:numKept)*S(1:numKept,1:numKept)*V(:,1:numKept)';
imagesc(Itmp)