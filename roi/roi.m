clc;
close all;
clear all;

% amir shokri
% amirsh.nll@gmail.com

img1 = imread('baboon.png');
img2 = imread('girl.png');
img3 = imread('lena.png');
img4 = imread('monarch.png');
img_x = 512;
img_y = 512;

img_loop = img1;

img_gray = 0;
img_gray_key = 0;
img_gray_temp = 0;

low1 =1;
low2 =1;
high1=round(img_x / 3);
high2=round(img_y / 3);

counter = 0;
k = 1;
l = 1;
while(k < 4)
    counter = counter + 1;
    output = num2str(k);
    output = strcat(output, ' , ');
    output = strcat(output, num2str(l));
    output = strcat(output, ' : ');
    for i=low1:high1
       for j=low2:high2
           img_gray_temp = img_gray_temp + int64( img_loop(i, j, 1) * 0.299 ) + int64( img_loop(i, j, 2) * 0.587 ) + int64( img_loop(i, j, 3) * 0.144 );
       end
    end
    
    output = strcat(output, ' ' , num2str(img_gray_temp));
    disp(output);
    if(img_gray < img_gray_temp)
       img_gray = img_gray_temp;
       img_gray_key = [k l];
    end
    
    if(l==3)
       k = k + 1;
       l = 1;
       low1 = 1;
       high1=round(img_x / 3);
       if(k==1)
            low1 = high1 + 1;
            high1 = high1 + round(img_x / 3);
        end
        if(k==2)
           low2 = round(img_y / 3) + 1;
           high2 = low2 + round(img_y / 3);
        end
        if(k==3)
           low2 = round(img_y / 3) + round(img_y / 3);
           high2 = img_y;
        end
    else
        if(k==1)
            low1 = high1 + 1;
            high1 = high1 + round(img_x / 3);
            l = l + 1;
        end
        if(k==2)
           low1 = high1 + 1;
           high1 = high1 + round(img_x / 3);
           low2 = round(img_y / 3) + 1;
           high2 = low2 + round(img_y / 3);
           l = l + 1;
        end
        if(k==3)
           low1 = high1 + 1;
           high1 = high1 + round(img_x / 3);
           low2 = round(img_y / 3) + round(img_y / 3);
           high2 = img_y;
           l = l + 1;
        end
    end
    
    if(high1 > img_x)
        high1 = img_x;
    end
    
    if(high2 > img_y)
        high2 = img_y;
    end
    
    img_gray_temp = 0;
end
output = [ 'result : ', num2str(img_gray_key)];
disp(output);
