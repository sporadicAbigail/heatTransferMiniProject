% this function implements the secant method to find the zeros of a
% function with an unknown derivative
% it takes in the function and two initial guesses as its arguments
% (C) Robert B, 2021

function ret = secantMethod(fxn, x0, x1)
ret = 0;
error = 10;

% one guess less than 0, the other must be greater than 0
while error > 0.00001
    x2 = (x0*fxn(x1) - x1*fxn(x0))/(fxn(x1) - fxn(x0));
    x0 = x1;
    x1 = x2;
    
    error = abs(x1-x0);
    ret = x2;
end

end