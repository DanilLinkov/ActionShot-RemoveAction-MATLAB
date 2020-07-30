% The PixelDistance function calculates the square of the distance between
% two points in colour space

% Input:
% P1 = RGB point 1
% P2 = RGB point 2

% Output:
% Distance = Distance between the points in 3d colour space

% Author: Danil Linkov

function [Distance] = PixelDistance(P1,P2)

% making P1 and P2 double values to use them for calculations which result
% in values larger than 255
P1 = double(P1);
P2 = double(P2);

% Using the 3d distance equation to calculate the distance between the
% points in 3d colour space

% since there are only 3 numbers per point indexing is used in order to be
% able to apply the equation for points that are 3d or a normal matrix with
% 3 points
Distance = (P1(1)-P2(1))^2 + (P1(2)-P2(2))^2 + (P1(3)-P2(3))^2;
end
