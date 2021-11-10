function nus = nusseltCalcInternal(reynolds,prandtl,length,diameter,cooling)
% Find the Nusselt number for internal flow in a tube
% cooling defines if it is cooled or heated. 0 corresponds to no (heating).
% 1 corresponds to yes (cooling)
% This returns as unitless
% If you have questions: Ask Abigail
        
% Not sure how much I need to explain here, it just follows the flow of
% thought to decide which equation to use to get the nusselt number
    if reynolds < 2300
        %   Laminar internal flow in tube ASSUMING Tsurface is CONSTANT
        graetz = diameter/length*reynolds*prandtl;
        nus = 3.66+0.0668*graetz/(1+0.04*graetz^(2/3));
    elseif reynolds > 10000
        if cooling == 0
            % it's being heated
            nus = 0.023*reynolds^(0.8)*prandtl^0.4;
        elseif cooling == 1
            % it's being cooled
            nus = 0.023*reynolds^(0.8)*prandtl^0.3;
        else
            % Just an error message to help track where things went wrong
            disp('nusseltCalcInternal cooling value error')
        end
    else
        % Just an error message to help track where things went wrong
        disp('nusseltCalcInternal No correlation found')
    end
        
end