clc;
close all;
clear all;

% amir shokri
% amirsh.nll@gmail.com

img1 = imread('roi.jpg');
img_x = 300;
img_y = 300;

img2 = uint8(zeros(img_x + 20, img_y + 20, 3));


for i=1:100
    for j=1:100
        img2(i, j, 1) = img1(i, j, 1);
        img2(i, j, 2) = img1(i, j, 2);
        img2(i, j, 3) = img1(i, j, 3);
    end
end

for i=1:100
    for j=100:200
        img2(i, j + 10, 1) = img1(i, j, 1);
        img2(i, j + 10, 2) = img1(i, j, 2);
        img2(i, j + 10, 3) = img1(i, j, 3);
    end
end

for i=1:100
    for j=200:300
        img2(i, j + 20, 1) = img1(i, j, 1);
        img2(i, j + 20, 2) = img1(i, j, 2);
        img2(i, j + 20, 3) = img1(i, j, 3);
    end
end

for i=100:200
    for j=100:200
        img2(i + 10, j + 10, 1) = img1(i, j, 1);
        img2(i + 10, j + 10, 2) = img1(i, j, 2);
        img2(i + 10, j + 10, 3) = img1(i, j, 3);
    end
end

for i=100:200
    for j=1:100
        img2(i + 10, j, 1) = img1(i, j, 1);
        img2(i + 10, j, 2) = img1(i, j, 2);
        img2(i + 10, j, 3) = img1(i, j, 3);
    end
end

for i=100:200
    for j=200:300
        img2(i + 10, j + 20, 1) = img1(i, j, 1);
        img2(i + 10, j + 20, 2) = img1(i, j, 2);
        img2(i + 10, j + 20, 3) = img1(i, j, 3);
    end
end

for i=100:200
    for j=100:200
        img2(i + 10, j + 10, 1) = img1(i, j, 1);
        img2(i + 10, j + 10, 2) = img1(i, j, 2);
        img2(i + 10, j + 10, 3) = img1(i, j, 3);
    end
end

for i=200:300
    for j=200:300
        img2(i + 20, j + 20, 1) = img1(i, j, 1);
        img2(i + 20, j + 20, 2) = img1(i, j, 2);
        img2(i + 20, j + 20, 3) = img1(i, j, 3);
    end
end

for i=200:300
    for j=1:100
        img2(i + 20, j, 1) = img1(i, j, 1);
        img2(i + 20, j, 2) = img1(i, j, 2);
        img2(i + 20, j, 3) = img1(i, j, 3);
    end
end

for i=200:300
    for j=100:200
        img2(i + 20, j + 10, 1) = img1(i, j, 1);
        img2(i + 20, j + 10, 2) = img1(i, j, 2);
        img2(i + 20, j + 10, 3) = img1(i, j, 3);
    end
end

imshow(img2);