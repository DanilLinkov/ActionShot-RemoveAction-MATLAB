% The GenerateFrameList function generates a list of frames depending on
% the start step and number of frames wanted inputted.

% Input:
% start = starting frame
% step = frame step size
% numberOfFrames = number of frames needed

% Output:
% frameList = list of frames generated

% Author: Danil Linkov

function [frameList] = GenerateFrameList(start,step,numberOfFrames)

% using start:step:stop to generate the frames
frameList = [start:step:(numberOfFrames*step+start-step)];

end