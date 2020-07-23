clc;
clear all;
close all;

% amir shokri
% amirsh.nll@gmail.com

image_ref          = imread('img/image_ref.jpg');
filter             = imread('img/filter.jpg');

image               = image_ref;
filter              = filter;

correlation = normxcorr2(filter(:,:), image(:,:));
figure, imshow(correlation);
title('Correlation image');
    
[maxCorrValue, maxIndex] = max(abs(correlation(:)));
[yPeak, xPeak] = ind2sub(size(correlation), maxIndex(1));

corr_offset = [(xPeak - size(filter, 2)) (yPeak - size(filter, 2))];

if(corr_offset(1) < 0)
   corr_offset(1) = corr_offset(1) * (-1); 
end

if(corr_offset(2) < 0)
   corr_offset(2) = corr_offset(2) * (-1); 
end

axis on;
hold on;
figure, imshow(image);
title('find area');
boxRect = [corr_offset(1) corr_offset(2) 200, 200];
rectangle('position', boxRect, 'edgecolor', 'r', 'linewidth', 2);