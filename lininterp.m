function y = lininterp(x,x1,x2,y1,y2)
    y=y1+(x-x1)*((y2-y1)/(x2-x1)); %performs a linear interpolation
end