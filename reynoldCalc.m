function Re = reynoldCalc(velocity,diameter,nu)
    % This function finds Reynolds number using velocity of the fluid far away
    % from the wall in meters/second, the outside diameter of the pipe in
    % meters, nu in meters^2/second
    Re = velocity*diameter/nu;
end