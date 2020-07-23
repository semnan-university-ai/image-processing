function mean_result = mean(image_binary, x, y)

  % amir shokri
  % amirsh.nll@gmail.com

    img1 = image_binary;
    img2 = img1;

    sum = 0;

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
               sum = pixels(i, j) * pixels(i, j+1) * pixels(i+1, j) * pixels(i+1, j+1);
               sum = sum ^ (1/4);
           elseif(i == x_img && j == 1)
               sum = pixels(i-1, j) * pixels(i-1, j+1) * pixels(i, j) * pixels(i-1, j+1);
               sum = sum ^ (1/4);
           elseif(i == 1 && j == y_img)
               sum = pixels(i, j-1) * pixels(i, j) * pixels(i+1, j-1) * pixels(i+1, j);
               sum = sum ^ (1/4);
           elseif(i == x_img && j == y_img)
               sum = pixels(i-1, j-1) * pixels(i-1, j) * pixels(i, j-1) * pixels(i, j);
               sum = sum ^ (1/4);
           elseif(i == 1)
               sum = pixels(i, j-1) * pixels(i, j) * pixels(i, j+1) * pixels(i+1, j-1) * pixels(i+1, j) * pixels(i+1, j+1);
               sum = sum ^ (1/6);
           elseif(i == x_img)
               sum = pixels(i-1, j-1) * pixels(i-1, j) * pixels(i-1, j+1) * pixels(i, j-1) * pixels(i, j) * pixels(i-1, j+1);
               sum = sum ^ (1/6);
           elseif(j == 1)
               sum = pixels(i-1, j) * pixels(i-1, j+1) * pixels(i, j) * pixels(i-1, j+1) * pixels(i+1, j) * pixels(i+1, j+1);
               sum = sum ^ (1/6);
           elseif(j == y_img)
               sum = pixels(i-1, j-1) * pixels(i-1, j) * pixels(i, j-1) * pixels(i, j) * pixels(i+1, j-1) * pixels(i+1, j);
               sum = sum ^ (1/6);
           else
               sum = pixels(i-1, j-1) * pixels(i-1, j) * pixels(i-1, j+1) * pixels(i, j-1) * pixels(i, j) * pixels(i-1, j+1) * pixels(i+1, j-1) * pixels(i+1, j) * pixels(i+1, j+1);
               sum = sum ^ (1/9);
           end

           img2(i, j) = sum;
           sum = 0;
       end
    end
    mean_result = img2;
end

