clc;
clear all;
close all;

% amir shokri
% amirsh.nll@gmail.com

berenj = zeros(840,840);
im1 = imread('berenj.bmp');
x = 840;
y = 840;

% tabdil ax be siah sefid
for i = 1 : 832
    for j = 1 : 820
        if(im1(i, j) > 98)
            berenj(i + 2, j + 2) = 255;
        else
            berenj(i + 2, j + 2) = 0;
        end
    end
end

% kamtar kardane khanehaie khali
for i = 1 : x
    for j = 1 : y
        if( berenj(i, j) == 255)
        
            %if( berenj(i + 2, j + 2) == 0 && berenj(i - 2, j - 2) == 0 && berenj(i + 2, j) == 0 && berenj(i, j + 2) == 0 && berenj(i-2, j) == 0 && berenj(i, j - 2) == 0 && berenj(i + 2, j - 2) == 0 && berenj(i - 2, j + 2) == 0 )
            if( berenj(i + 2, j) == 0 && berenj(i, j + 2) == 0 && berenj(i - 2, j) == 0 && berenj(i, j - 2) == 0 )
                berenj(i, j) = 0;
            end
        end
    end
end

sum = 0;

for i = 1 : x
    for j = 1 : y
        
        if( berenj(i, j) == 255 )
            
            % yaftan paian berenj peida shode
            for k = i : x
                if( berenj(k, j) == 0 )
                    break;
                end
            end
            
            % hazf berenj
            for kk = i : k - 1
                for m = j : y - 1
                    berenj(kk, m) = 0;
                    if( berenj(kk, m + 1) == 0 )
                        continue;
                    end
                end
            end
            
            sum = sum + 1;
        
        end
        
    end
end

% natije - baiad siah beshe yani hamaro shemorde
figure, imshow(berenj);