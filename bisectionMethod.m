% this function implements the bisection method to find a minimum
% it takes two arguments, one producing a positive f(x) and the other
% producing a negative f(x), and closes in to find a zero

function ret = bisectionMethod(fxn, xleft, xright)

for i = 1:20
    center = (xleft + xright)/2;
    fleft = fxn(xleft);
    fcenter = fxn(center);
    
    % check if the values are on the same side of the axis
    if (fcenter * fleft) > 0
        xleft = center;
    else
        xright = center;
    end
    
ret = center;

end