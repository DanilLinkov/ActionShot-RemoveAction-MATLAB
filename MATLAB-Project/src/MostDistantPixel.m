% The mostDistantPixel function calculates the pixels value that is
% the most distant from the median RGB values from that list

% Input:
% pixels = A list of pixels n by n by 3 (adapted to work for multiple rows

% Output:
% r = most distant r value from the most distant pixel
% g = most distant r value from the most distant pixel
% b = most distant r value from the most distant pixel

% Author: Danil Linkov

function [r,g,b] = MostDistantPixel(pixels)
% turning the pixels from uint8 values into doubles values to be able to
% perform calculations
pixels = double(pixels);

% finding the rows and cols of the pixels matrix being recieved
[rows,cols,~] = size(pixels);

% if number of cols is equal to 1 then just return the RGB values of the
% pixels matrix
if cols == 1
    r = pixels(:,:,1);
    g = pixels(:,:,2);
    b = pixels(:,:,3);
else
    % else proceed to find the most distant pixel
    
    % transpose the pixels matrix in order to be able to perform the median
    % on all the rows for every col without having to loop
    pixels = permute(pixels,[2 1 3]);
    MedianPixel = median(pixels);
    % splitting pixels matrix into 3 arrays R G and B
    pixelsR = pixels(:,:,1);
    pixelsG = pixels(:,:,2);
    pixelsB = pixels(:,:,3);
    
    % performing the distance equation on the whole 3d matrix
    Distance = (pixels(:,:,1)-MedianPixel(:,:,1)).^2 + (pixels(:,:,2)-MedianPixel(:,:,2)).^2 + (pixels(:,:,3)-MedianPixel(:,:,3)).^2;
    
    % finding the row at which the maximum distance is located for each col
    [~,position] = max(Distance);
    
    % setting that row position into a position index
    position = position + [(0:cols:((rows*cols)-cols+1))];
    
    % finding the red, green and blue vlues by using the position index for
    % the whole matrix
    r = pixelsR(position);
    g = pixelsG(position);
    b = pixelsB(position);
end
end

