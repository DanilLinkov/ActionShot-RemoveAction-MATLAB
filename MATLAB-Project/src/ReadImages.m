% The ReadImages function reads in a specified list of images given the
% filenames and the directory the files are located in

% Input:
% directory = directory of the files
% names = names of the files

% Output:
% Images = cell array of images where each element is an RGB image

% Author: Danil Linkov



function [Images] = ReadImages(directory,names)

% Creating the output which is going to be a cell array
Images = {};

% Looping through each name
for i = 1:length(names)
    % Concatenating the strings of the directory and the name of the file
    % then passing it into the imread function to read each RGB picture
    % into an element in the Images cell array
    Images{i} = imread([directory '\' names{i}]);
end
end



