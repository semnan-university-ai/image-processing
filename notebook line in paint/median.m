function median_result = median(image_binary, x, y)

% amir shokri
% amirsh.nll@gmail.com

    img1 = image_binary;
    img2 = img1;

    median_number = [];
    new_value = 0;

    x_img = x;
    y_img = y;

    pixels = zeros(x_img, y_img);

    for i = 1:x_img
       for j= 1:y_img
        pixels(i, j) = img1(i, j);
       end
    end

    for i = 1:x_img
       for j= 1:y_img
           if(i == 1 && j == 1)
               median_number = [pixels(i, j) pixels(i, j+1) pixels(i+1, j) pixels(i+1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(2);
           elseif(i == x_img && j == 1)
               median_number = [pixels(i-1, j) pixels(i-1, j+1) pixels(i, j) pixels(i-1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(2);
           elseif(i == 1 && j == y_img)
               median_number = [pixels(i, j-1) pixels(i, j) pixels(i+1, j-1) pixels(i+1, j)];
               median_number = sort(median_number);
               new_value = median_number(2);
           elseif(i == x_img && j == y_img)
               median_number = [pixels(i-1, j-1) pixels(i-1, j) pixels(i, j-1) pixels(i, j)];
               median_number = sort(median_number);
               new_value = median_number(2);
           elseif(i == 1)
               median_number = [pixels(i, j-1) pixels(i, j) pixels(i, j+1) pixels(i+1, j-1) pixels(i+1, j) pixels(i+1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(3);
           elseif(i == x_img)
               median_number = [pixels(i-1, j-1) pixels(i-1, j) pixels(i-1, j+1) pixels(i, j-1) pixels(i, j) pixels(i-1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(3);
           elseif(j == 1)
               median_number = [pixels(i-1, j) pixels(i-1, j+1) pixels(i, j) pixels(i-1, j+1) pixels(i+1, j) pixels(i+1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(3);
           elseif(j == y_img)
               median_number = [pixels(i-1, j-1) pixels(i-1, j) pixels(i, j-1) pixels(i, j) pixels(i+1, j-1) pixels(i+1, j)];
               median_number = sort(median_number);
               new_value = median_number(3);
           else
               median_number = [pixels(i-1, j-1) pixels(i-1, j) pixels(i-1, j+1) pixels(i, j-1) pixels(i, j) pixels(i-1, j+1) pixels(i+1, j-1) pixels(i+1, j) pixels(i+1, j+1)];
               median_number = sort(median_number);
               new_value = median_number(4);
           end

           img2(i, j) = new_value;
           new_value = 0;
       end
    end
    
    median_result = img2;

end
