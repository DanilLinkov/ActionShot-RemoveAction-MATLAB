% The RemoveAction function creates an image that has the action removed by
% applying a median filter

% Input:
% Image = cell array with each element being an RGB image

% Output:
% MedianImage = image with the action removed

% Author: Danil Linkov

function [MedianImage] = RemoveAction(Images)

% finding out the dimensions

% the number of images in the cell array
NumberOfImages = length(Images);

% rows cols and layers of the images
[row,col,layer] = size(Images{1});

% prelocating memory for speed
MedianImage = zeros(row,col,layer,'uint8');
RowMatrixOfImages = zeros(1,col*NumberOfImages,3,'uint8');

% using cell2mat in order to change the cell array of Images into 1 big
% matrix that can be easily manipulated
Images = cell2mat(Images);

% looping through all the rows in the images
for j = 1:row
    
    % grabbing the same row from every image
    RowMatrixOfImages = Images(j,:,:);
    
    % reshaping and transposing it in order to be able to use median on the
    % whole matrix
    RowMatrixOfImages = reshape(RowMatrixOfImages,[col,NumberOfImages,3]);
    RowMatrixOfImages = permute(RowMatrixOfImages,[2 1 3]);
    
    % the new matrix is supposed to allow median to median every col and
    % return a 1 by col by 3 matrix of median pixels
    
    % using the median filter and then just setting that median row to
    % equal the same row of the final MedianImage output
    MedianImage(j,:,:) = median(RowMatrixOfImages);
end
end
