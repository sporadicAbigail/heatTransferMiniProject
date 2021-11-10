%{
This function outputs the momentum diffusivity for water (nuw) in
m^2/s as a function of the surface temp Tsurf using the secant method and
bisection method.
%}
function nuw = nuwater(Tsurf)
nu1 = 1.795e-6; %at T = 273K
nu2 = 0.995e-6; %at T = 293K
nu3 = 0.663e-6; %at T = 313K
nu4 = 0.480e-6; %at T = 333K
nu5 = 0.362e-6; %at T = 353K
nu6 = 0.290e-6; %at T = 373K

%First from secant method
if (273 <= Tsurf) && (Tsurf < 293)
    nuw = lininterp(Tsurf,273,293,nu1,nu2);
    elseif (293 <= Tsurf) && (Tsurf < 313)
        nuw = lininterp(Tsurf,293,313,nu2,nu3);
            elseif (313 <= Tsurf) && (Tsurf < 333)
                nuw = lininterp(Tsurf,313,333,nu3,nu4);
            elseif (333 <= Tsurf) && (Tsurf < 353)
                nuw = lininterp(Tsurf,333,353,nu4,nu5);
    elseif (353 <= Tsurf) && (Tsurf <=373)
        nuw = lininterp(Tsurf,353,373,nu5,nu6);
else
    % This error term displays and returns not a number for nu.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    nuw = lininterp(Tsurf,0,0,0,0);
end
end