clc;
clear;
close all;

% amir shokri
% amirsh.nll@gmail.com

image_raw       = imread('paint/paint.jpg');
image_paint     = image_raw;
image_size      = size(image_paint);
image_x         = image_size(1);
image_y         = image_size(2);

size_check = size(image_size);
if(size_check(1, 2) > 2)
    image_paint = rgb2gray(image_paint);
end

image_bin   = imbinarize(image_paint, 'adaptive', 'ForegroundPolarity', 'dark', 'Sensitivity', 0.5);

SE1 = strel('line',6, 180);
SE2 = strel('line',2, 90);
SE3 = strel('line',7, 90);
image_erode = imerode(image_bin, SE2);
image_dilate = imdilate(image_erode, SE1);
image_dilate = imdilate(image_dilate, SE3);

median_result = median(image_dilate, image_x, image_y);
mean_result = mean(image_dilate, image_x, image_y);

figure;
subplot(1,2,1), imshow(image_raw);
title('image raw');
subplot(1,2,2), imshow(image_dilate);
title('image result');
