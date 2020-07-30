% The ActionShot function creates an action shot image by finding the
% pixels from a stack of images athat are most distant from the median RGB
% values

% Input:
% Image = cell array of images where each element is an RGB image

% Output:
% ActionShot = image with the action shot

% Author: Danil Linkov

function [ActionShot] = ActionShot(Images)
% finding out the dimesions

% the number of images in the cell array
NumberOfImages = length(Images);

% rows cols and layers of the images
[row,col,layer] = size(Images{1});

% prelocating memory for speed
ActionShot = ones(row,col,layer,'uint8');
RowOfEveryImage = zeros(1,col*NumberOfImages,3,'uint8');

% using cell2mat in order to change the cell array of Images into 1 big
% matrix that can be easily manipulated
Images = cell2mat(Images);

% looping through all the rows in the images
for j = 1:row
    
    % grabbing the same row from every image
    RowOfEveryImage = Images(j,:,:);
    
    % reshaping the matrix in order to be able to apply the
    % MostDistantPixel function on the whole matrix
    RowOfEveryImage = reshape(RowOfEveryImage,[col,NumberOfImages,layer]);
    
    % applying the MostDistantPixel function on the whole matrix and
    % setting the output R G B values to their layers in the final output
    % ActionShot image
    [ActionShot(j,:,1),ActionShot(j,:,2),ActionShot(j,:,3)] = MostDistantPixel(RowOfEveryImage(:,:,:));
    
end
end

