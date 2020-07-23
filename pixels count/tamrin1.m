clc;
clear all;
close all;

% amir shokri
% amirsh.nll@gmail.com

pixels = zeros(1, 256);
im1 = imread('amir.bmp');
index = 0;

for i = 1 : 128
    for j = 1 : 128
        index = im1(i, j);
        if( index > -1 && index < 256 )
            pixels( 1, index + 1 ) = pixels( 1, index + 1 ) + 1;
        end
    end
end