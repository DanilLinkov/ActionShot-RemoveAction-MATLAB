% The MedianPixel function calculates the median RGB values from a list of
% pixels

% Input:
% pixelList = 1xnx3 3D array of RGB values of a list of pixels

% Output:
% MedR = median Red value from the pixelList
% MedG = median Green value from the pixelList
% MedB = median Blue value from the pixelList

% Author: Danil Linkov

function [MedR,MedG,MedB] = MedianPixel(pixelList)
% Using the median function on each layer of the pixelList and then rouding
% it incase the pixelList is not in uint8
MedR = round(median(pixelList(:,:,1)));
MedG = round(median(pixelList(:,:,2)));
MedB = round(median(pixelList(:,:,3)));
end

