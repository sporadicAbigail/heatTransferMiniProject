
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
        %{ 
        elseif type == 2
        % looking at internal flow
        if reynolds < 2300
            % I don't think nusselts is even needed for our project for
            % internal flow, so I'm just putting the scaffolding here, but
            % it's not going to run
            graetz = diameter/length*reynolds*prandtl;
            nus = 3.66+0.0668*graetz/(1+0.04*graetz^(2/3))
        elseif reynolds > 10000
            % requires knowledge if it is being cooled or heated
            % for now, assuming being heated
            nus = 0.023*reynolds^(0.8)*prandtl^0.4;
        else
            disp('No correlation found')
        end
        %}
    else
        disp('incorrect type was inputted')
        % an error occurred
    end 
end