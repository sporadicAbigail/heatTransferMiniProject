%{
This function calculates the thermal conductivity of air (ka)in W/(m)(K)
as a function of surface temp Tsurf using the secant method and bisection 
method.
%}
function ka = kair(Tsurf)
kf1 = 2.3080e-2; %at T = 260K
kf2 = 2.4671e-2; %at T = 280K
kf3 = 2.6240e-2; %at T = 300K
kf4 = 2.7785e-2; %at T = 320K
kf5 = 2.9282e-2; %at T = 340K
kf6 = 3.0779e-2; %at T = 360K
kf7 = 3.3651e-2; %at T = 400K

%First from secant method
if (260 <= Tsurf) && (Tsurf < 280)
    ka = lininterp(Tsurf_s,260,280,kf1,kf2);
    elseif (280 <= Tsurf) && (Tsurf < 300)
        ka = lininterp(Tsurf_s,280,300,kf2,kf3);
        elseif (300 <= Tsurf) && (Tsurf < 320)
            ka = lininterp(Tsurf_s,300,320,kf3,kf4);
            elseif (320 <= Tsurf) && (Tsurf < 340)
                ka = lininterp(Tsurf,320,340,kf4,kf5);
        elseif (340 <= Tsurf) && (Tsurf < 360)
            ka = lininterp(Tsurf,340,360,kf5,kf6);
    elseif (360 <= Tsurf) && (Tsurf <= 400) 
        ka = lininterp(Tsurf,360,400,kf6,kf7);
else
    % This error term displays and returns not a number for kair.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    ka = lininterp(Tsurf,0,0,0,0);
end
end