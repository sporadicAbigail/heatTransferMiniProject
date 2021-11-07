function Pr = prandtlCalc(temp)
%This function finds the Prandtl number for air (unitless)
% Input temperature in Kelvin between 273 and 373
% This is valid for both free and forced convection of air
% MATLAB arrays start at 1!! Not 0!
% Written by Abigail (for Github purposes)

% these two arrays hold the values that will be interpolated against
prValues = [13.6, 6.96, 4.33, 3.00, 2.57, 1.72];
tempValues = [273, 293, 331, 333, 353, 373];

% now just a bunch of if statements to see which range will be
% interpolating over
% could I use a for loop? Yes. Am I? No.
if (temp >= tempValues(1)) && (temp < tempValues(2))
    % basically based on where you are in the range of temperatures, you'll
    % enter an if statement, which will define what should be the x1, y1,
    % x2, y2 for the linear interpolation
    prLow = prValues(1);
    prHigh = prValues(2);
    tempLow = tempValues(1);
    tempHigh = tempValues(2);
    %disp('one')
elseif (temp >= tempValues(2)) && (temp < tempValues(3))
    prLow = prValues(2);
    prHigh = prValues(3);
    tempLow = tempValues(2);
    tempHigh = tempValues(3);
    %disp('two')
elseif (temp >= tempValues(3)) && (temp < tempValues(4))
    prLow = prValues(3);
    prHigh = prValues(4);
    tempLow = tempValues(3);
    tempHigh = tempValues(4);
    %disp('three')
elseif (temp >= tempValues(4)) && (temp < tempValues(5))
    prLow = prValues(4);
    prHigh = prValues(5);
    tempLow = tempValues(4);
    tempHigh = tempValues(5);
    %disp('four')
elseif (temp >= tempValues(5)) && (temp < tempValues(6))
    prLow = prValues(5);
    prHigh = prValues(6);
    tempLow = tempValues(5);
    tempHigh = tempValues(6);
    %disp('five')
else
    % basically an error message
    disp('Out of range')
    prLow = 0;
    prHigh = 0;
    tempLow = 0;
    tempHigh = 0;
end
% lininterp is a user defined function that does a linear interpolation
Pr = lininterp(temp,tempLow,tempHigh,prLow,prHigh);
end