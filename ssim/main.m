clc;
clear all;
close all;

% amir shokri
% amirsh.nll@gmail.com

einstein = 'einstein.bmp';
einstein_blur_eye = 'einstein_blur_eye.bmp';
einstein_coat_damage = 'einstein_coat_damage.bmp';
einstein_histogram_change = 'einstein_histogram_change.bmp';

image1 = einstein;
image2 = einstein_histogram_change;
K = [0.01 0.03];
window = fspecial('gaussian', 11, 1.5);
L = 255;

result = ssim(image1, image2, K, window, L)