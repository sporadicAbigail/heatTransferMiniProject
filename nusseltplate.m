%{
This function calculates the Nusselt number for a flat plate on it is free
or forced type == 0 free convection and type == 1 forced external
convection When there's no corresponding Rayleigh (forced convection) or 
Reynold (free convection) number just input dummy numbers
%}

function nusp = nusseltplate(reynolds,prandtl,rayleigh,type)

if type == 0
% meaning if it is externaln free convection
    nusp = (0.825 + (0.387*rayleigh^(1/6))/((1 + (0.492/prandtl)^(9/16))^(8/27)))^2;
elseif type == 1
    % meaning if it is external forced convection
    if (1e3 < reynolds)&&(reynolds < 5e5)
    % This correlation is for a reynolds number corresponding to laminar flow
        nusp = 0.664*reynolds^(1/2)*prandtl^(1/3);
    elseif (reynolds > 5e5)
    % This correlation is for a reynolds number turbulent flow
        nusp = 0.036*reynolds^(4/5)*prandtl^(1/3);
    else
       disp('The reynolds number you entered is outside the range')
       nusp = NaN;
    end
else
    disp('incorrect type entered')
end
end