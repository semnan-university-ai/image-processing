
% Amir Shokri
% Dr.Yaghmaii
% Term bahman
% Pardazesh tasvir
% Tamrin 1

% amir shokri
% amirsh.nll@gmail.com

clc;
close all;
clear all;

% khandane tasvir aval wa namaiesh 8 bit plane
Lenna_img = imread('Lenna.png');
img1_dobule = double(Lenna_img);
img2 = bitget(img1_dobule, 8); 
figure, imshow(img2);

% khandane tasvir dovom
poem_img = imread('text.jpg');

% agar ham size nabodan ham saiz mikonim ba imresize()
Lenna_img = imresize(Lenna_img, [256 256]);
poem_img = imresize(poem_img, [256 256]);
temp_lanna = Lenna_img;
poem_img = rgb2gray(poem_img);

% Black white kardane sher baraie tashkhis matn
for i=1:256
    for j=1:256
        if( poem_img(i, j) < 150 )
            poem_img(i, j) = 0;
        else
            poem_img(i, j) = 255;
        end
    end
end

% andakhtan sher roie ax
for i=1:256
    for j=1:256
        if( poem_img(i, j) == 0 )
            Lenna_img(i, j, 1) = 0;
            Lenna_img(i, j, 2) = 0;
            Lenna_img(i, j, 3) = 0;
        end
    end
end

figure, imshow(Lenna_img);

% kam hajm kardan 8 bit plane
img3 = bitget(double(img2), 1); 
figure, imshow(img3);

% histogram tasivir 1 va 2 : tasviri ke bad az ezafe kardan sher histogram
% gereftim bakhshe 0 bshtari darad
figure,histogram(Lenna_img);
figure,histogram(temp_lanna);


% hamvarsazi histogram 2
img5 = Lenna_img;
Lenna_img2 = img5;
pixel_histogram = zeros(1, 256, 3);
pixel_cdf = zeros(1, 256, 3);
pixel_new_value  = zeros(1, 256, 3);

for i = 1 : 256
    for j = 1 : 256
        pixel_histogram(1, img5(i,j, 1) + 1, 1) = pixel_histogram(1, img5(i,j, 1) + 1, 1) + 1;
        pixel_histogram(1, img5(i,j, 2) + 1, 2) = pixel_histogram(1, img5(i,j, 2) + 1, 2) + 1;
        pixel_histogram(1, img5(i,j, 3) + 1, 3) = pixel_histogram(1, img5(i,j, 3) + 1, 3) + 1;
    end
end

pixel_cdf(1, 1, 1) = pixel_histogram(1, 1, 1);
pixel_cdf(1, 1, 2) = pixel_histogram(1, 1, 2);
pixel_cdf(1, 1, 3) = pixel_histogram(1, 1, 3);
min_cdf_1 = pixel_histogram(1, 1, 1);
min_cdf_2 = pixel_histogram(1, 1, 2);
min_cdf_3 = pixel_histogram(1, 1, 3);
max_cdf_1 = pixel_histogram(1, 1, 1);
max_cdf_2 = pixel_histogram(1, 1, 2);
max_cdf_3 = pixel_histogram(1, 1, 3);
for k = 2 : 256
   pixel_cdf(1, k, 1) = pixel_cdf(1, k - 1, 1) + pixel_histogram(1, k, 1);
   pixel_cdf(1, k, 2) = pixel_cdf(1, k - 1, 2) + pixel_histogram(1, k, 2);
   pixel_cdf(1, k, 3) = pixel_cdf(1, k - 1, 3) + pixel_histogram(1, k, 3);
   
   if( pixel_cdf(1, k, 1) > max_cdf_1 )
       max_cdf_1 = pixel_cdf(1, k, 1);
   end
   
   if( pixel_cdf(1, k, 1) < min_cdf_1 )
        min_cdf_1 = pixel_cdf(1, k, 1);
   end
   
   if( pixel_cdf(1, k, 2) > max_cdf_2 )
       max_cdf_2 = pixel_cdf(1, k, 2);
   end
   
   if( pixel_cdf(1, k, 2) < min_cdf_2 )
        min_cdf_2 = pixel_cdf(1, k, 2);
   end
   
   if( pixel_cdf(1, k, 3) > max_cdf_3 )
       max_cdf_3 = pixel_cdf(1, k, 3);
   end
   
   if( pixel_cdf(1, k, 3) < min_cdf_3 )
        min_cdf_3 = pixel_cdf(1, k, 3);
   end
end

for k = 1 : 256
    pixel_new_value(1, k, 1) = round( ( ( pixel_cdf(1, k, 1) - min_cdf_1 ) / ( max_cdf_1 - min_cdf_1 ) ) * 255 );
    pixel_new_value(1, k, 2) = round( ( ( pixel_cdf(1, k, 2) - min_cdf_2 ) / ( max_cdf_2 - min_cdf_2 ) ) * 255 );
    pixel_new_value(1, k, 3) = round( ( ( pixel_cdf(1, k, 3) - min_cdf_3 ) / ( max_cdf_3 - min_cdf_3 ) ) * 255 );
end

for i = 1 : 256
    for j = 1 : 256
        Lenna_img2(i,j, 1) = pixel_new_value(1, img5(i,j, 1) + 1, 1);
        Lenna_img2(i,j, 2) = pixel_new_value(1, img5(i,j, 2) + 1, 2);
        Lenna_img2(i,j, 3) = pixel_new_value(1, img5(i,j, 3) + 1, 3);
    end
end

figure, imshow(Lenna_img2);