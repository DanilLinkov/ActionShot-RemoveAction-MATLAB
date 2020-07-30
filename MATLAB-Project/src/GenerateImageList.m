% The GenerateImageList function creates a cell array containing the names
% of the files from a specific directory and with a specific extension

% Input:
% directory = where the files are located
% extension = extension on the files that are wanted

% Output:
% FileNames = names of the files with the wanted extension in a cell array

% Author: Danil Linkov

function [FileNames] = GenerateImageList(directory,extension)

% Creating a structured array which contains the file names with the
% extension and other information about the files
MyFiles = dir([directory '\*.' extension]); % Using regex \*. which finds
% all the files ending with (. + extension) string e.g. .jpg

% Finding the amount of rows in that array as that is equal to the amount
% of the files
[rows,~] =  size(MyFiles);

% Creating the output FileNames which is a cell array
FileNames = {};

% Looping through the rows of MyFiles which is equivalent to going through
% each file name inside the folder with the extension
for i = 1:rows
    % Putting all the file names inside MyFiles inside a cell array output
    FileNames{i} = MyFiles(i).name;
end

end
