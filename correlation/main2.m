clc;
close all;
clear all;

% amir shokri
% amirsh.nll@gmail.com

image_ref          = imread('img/image_ref.jpg');
filter             = imread('img/filter_ssim.jpg');

image               = image_ref;
filter              = filter;

image_ref_size = size(image_ref);
filter_size = size(filter);
temp_result = 0;
corr2val = 0;
ssim_result = zeros(image_ref_size(1), image_ref_size(2), 'int8');
K = [0.1 0.3];
window = fspecial('gaussian', 10, 2.5);
L = 255;
   
for m = round(filter_size(1) / 2) : image_ref_size(1)
    if(m + filter_size(1) > image_ref_size(1))
    	break; 
    end
	for n = round(filter_size(2) / 2) : image_ref_size(2)
        image_temp = zeros(filter_size(1), filter_size(2));
        if(n + filter_size(2) > image_ref_size(2))
           break; 
        end
        for i = m : m + filter_size(1)
        	for j = n : n + filter_size(2)
            	image_temp(i, j) = image_ref(i, j);
            end
        end
        res = ssim(image_temp, filter, K, window, L);
        if(res < 0)
        	res = res * (-1);
        end
        temp_result = round(res * 255);
        ssim_result(m, n) = int8(temp_result);
    end
end

figure, imshow(ssim_result);
title('find area with ssim');