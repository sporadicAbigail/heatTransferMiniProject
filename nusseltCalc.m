
function nus = nusseltCalc(reynolds,prandtl,rayleigh,type)
    % Calculate the Nusselt number depending on if it's free or forced
    % external convection for a cylinder pipe. Type 0 means free external, type 1 means
    % forced external. Type 2 means internal. When there's no corresponding Rayleigh (forced convection) or 
    % Reynold (free convection_number just input dummy numbers
    % Assuming L/D >> 1. This returns as unitless
    
    if type == 0
        % meaning if it is external free convection
        % for free convection of a horizontal cylinder with L/D >> 1
        nus = (0.60 + (0.387*rayleigh^(1/6))/((1+(0.559/prandtl)^(9/16))^(8/27)))^2;
            % please ignore the abundance of parentheses above - I over
            % parentheses'ed out of panic/confusion
    elseif type == 1
        % meaning if it is external forced convection
        % forced external flow over a cylinder with flow perpendicular to the axis and L/D >> 1 
        nus = 0.3 + 0.62*reynolds^(1/2)*prandtl^(1/3)/(1+(0.4/prandtl)^(2/3))^(1/4)*(1+(reynolds/282000)^(5/8))^(4/5);
    else
        disp('incorrect type was inputted')
        % an error occurred
    end 
end