clc;
clear all;
close all;

% amir shokri
% amirsh.nll@gmail.com

image1 = imread('1.jpg');
image2 = imread('2.jpg');

image1 = rgb2gray(image1);
image2 = rgb2gray(image2);

figure,
subplot(1,2,1);imshow(image1);title('image 1');
f1=fftshift(fft2(image1));
phase1=angle(f1);
subplot(1,2,2);imshow(phase1,[]),title('phase spectrum image 1');

figure,
subplot(1,2,1);imshow(image2);title('Test image 2');
f2=fftshift(fft2(image2));
phase2=angle(f2);
subplot(1,2,2);imshow(phase2,[]);title('phase spectrum image 2');