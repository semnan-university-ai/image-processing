clc;
close all;
clear all;

% amir shokri
% amirsh.nll@gmail.com

img1 = imread('img.png');
img2 = img1;

for i = 1 : 500
    for j = 1 : 500
        img2(i,j) = 255 - img1(i, j);
    end
end

figure, imshow(img1);
figure, imshow(img2);