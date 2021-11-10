%{
This function calculates the thermal conductivity of water (kw)in W/(m)(K)
as a function of surface temp Tsurf using the secant method and bisection 
method.
%}
function kw = kwater(Tsurf)
kf1 = 0.558; %at T = 273K
kf2 = 0.597; %at T = 293K
kf3 = 0.633; %at T = 313K
kf4 = 0.658; %at T = 333K
kf5 = 0.673; %at T = 353K
kf6 = 0.682; %at T = 373K

%First from secant method
if (273 <= Tsurf) && (Tsurf < 293)
    kw = lininterp(Tsurf,273,293,kf1,kf2);
    elseif (293 <= Tsurf) && (Tsurf < 313)
        kw = lininterp(Tsurf,293,313,kf2,kf3);
        elseif (313 <= Tsurf) && (Tsurf < 333)
            kw = lininterp(Tsurf,313,333,kf3,kf4);
        elseif (333 <= Tsurf) && (Tsurf < 353)
            kw = lininterp(Tsurf,333,353,kf4,kf5);
    elseif (353 <= Tsurf) && (Tsurf <= 373)
        kw = lininterp(Tsurf,353,373,kf5,kf6);
else
    % This error term displays and returns not a number for kw.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    kw = lininterp(Tsurf,0,0,0,0);
end
end