clc;
close all;
clear all;

% amir shokri
% amirsh.nll@gmail.com

img1 = imread('histogram.jpg');
img2 = img1;
pixel_histogram = zeros(1, 256);
pixel_cdf = zeros(1, 256);
pixel_new_value  = zeros(1, 256);

for i = 1 : 563
    for j = 1 : 1000
        pixel_histogram(1, img1(i,j) + 1) = pixel_histogram(1, img1(i,j) + 1) + 1;
    end
end

pixel_cdf(1, 1) = pixel_histogram(1, 1);
min_cdf = pixel_histogram(1, 1);
max_cdf = pixel_histogram(1, 1);
for k = 2 : 256
   pixel_cdf(1, k) = pixel_cdf(1, k - 1) + pixel_histogram(1, k);
   
   if( pixel_cdf(1, k) > max_cdf )
       max_cdf = pixel_cdf(1, k);
   end
   
   if( pixel_cdf(1, k) < min_cdf )
        min_cdf = pixel_cdf(1, k);
   end
end

for k = 1 : 256
    pixel_new_value(1, k) = round( ( ( pixel_cdf(1, k) - min_cdf ) / ( max_cdf - min_cdf ) ) * 255 );
end

for i = 1 : 563
    for j = 1 : 1000
        img2(i,j) = pixel_new_value(1, img1(i,j) + 1);
    end
end

imshow(img1);
figure, imshow(img2);