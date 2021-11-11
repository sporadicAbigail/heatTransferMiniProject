%{
This function outputs the density of water (rho) (kg/m^3) as function of the internal
temeperature of the pipe (Tin) using the secant and bisection methods.
%}
function rho = wadensity(Tin)
rho1 = 999.3; % at 273K
rho2 = 998.2; % at 293K
rho3 = 992.2; % at 313K
rho4 = 983.2; % at 333K
rho5 = 971.8; % at 353K
rho6 = 958.4; % at 373K
rho7 = 862.8; % at 473K

if (273 <= Tin) && (Tin < 293)
    rho = lininterp(Tin,273,293,rho1,rho2);
    elseif (293 <= Tin) && (Tin < 313)
        rho = lininterp(Tin,293,313,rho2,rho3);
        elseif (313 <= Tin) && (Tin < 333)
            rho = lininterp(Tin,313,333,rho3,rho4);
            elseif (333 <= Tin) && (Tin < 353)
                rho = lininterp(Tin,333,353,rho4,rho5);
        elseif (353 <= Tin) && (Tin < 373)
            rho = lininterp(Tin,353,373,rho5,rho6);
    elseif (373 <= Tin) && (Tin <= 473)
        rho = lininterp(Tin,373,473,rho6,rho7);
else
    % This error term displays and returns not a number for rho.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    rho = lininterp(Tin,0,0,0,0);
end
end