%{
This function calculates the thermal conductivity of water (kw)in W/(m)(K)
as a function of surface temp Tsurf using the secant method and bisection 
method.
%}
function kw = kwater(Tin)
kf1 = 0.558; %at T = 273K
kf2 = 0.597; %at T = 293K
kf3 = 0.633; %at T = 313K
kf4 = 0.658; %at T = 333K
kf5 = 0.673; %at T = 353K
kf6 = 0.682; %at T = 373K
kf7 = 0.665; %at T = 473K

if (273 <= Tin) && (Tin < 293)
    kw = lininterp(Tin,273,293,kf1,kf2);
    elseif (293 <= Tin) && (Tin < 313)
        kw = lininterp(Tin,293,313,kf2,kf3);
        elseif (313 <= Tin) && (Tin < 333)
            kw = lininterp(Tin,313,333,kf3,kf4);
            elseif (333 <= Tin) && (Tin < 353)
                kw = lininterp(Tin,333,353,kf4,kf5);
        elseif (353 <= Tin) && (Tin < 373)
            kw = lininterp(Tin,353,373,kf5,kf6);
    elseif (373 <= Tin) && (Tin <= 473)
        kw = lininterp(Tin,373,473,kf6,kf7);
else
    % This error term displays and returns not a number for kw.
    disp('Oops the value for Tsurf you entered is outside the Temp range. Please try again.')
    kw = lininterp(Tin,0,0,0,0);
end
end