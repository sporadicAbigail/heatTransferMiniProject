%{
This function calculates the Grashof number(Gr) (unitless) for air with respect to the
outer diameter of the pipe (Dopipe), the surface temp (Tsurf) and the ambient
temp (Ti). This function performs linear interpolation over a Grashof constant for temps found
using the secant method and bisection method and calculates the Grashof number for both methods.
%}
function Gr = Grashof(Tsurf,Dopipe,Ti)
Grc1 = 2.573e8; %at T = 260K
Grc2 = 1.815e8; %at T = 280K
Grc3 = 1.327e8; %at T = 300K
Grc4 = 0.9942e8; %at T = 320K
Grc5 = 0.7502e8; %at T = 340K
Grc6 = 0.5828e8; %at T = 360K
Grc7 = 0.3656e8; %at T = 400K

if (260 <= Tsurf) && (Tsurf < 280)
    Grc = lininterp(Tsurf,260,280,Grc1,Grc2);
    elseif (280 <= Tsurf) && (Tsurf < 300)
        Grc = lininterp(Tsurf,280,300,Grc2,Grc3);
        elseif (300 <= Tsurf) && (Tsurf < 320)
            Grc = lininterp(Tsurf,300,320,Grc3,Grc4);
            elseif (320 <= Tsurf) && (Tsurf < 340)
                Grc = lininterp(Tsurf,320,340,Grc4,Grc5);
        elseif (340 <= Tsurf) && (Tsurf < 360)
            Grc = lininterp(Tsurf,340,360,Grc5,Grc6);
    elseif (360 <= Tsurf) && (Tsurf <= 400) 
        Grc = lininterp(Tsurf,360,400,Grc6,Grc7);
else
    % This error term displays and returns not a number for kair.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    Grc = lininterp(Tsurf,0,0,0,0);
end

%disp(Grc_sec) %(For testing interpolation)
Gr = Grc*Dopipe^3*(Tsurf-Ti); %Calculates Grashof number for Tsurf using the secant method

if Gr <0
   disp('Tsurf_s < Ti which yields a negative Grashof number, please input another Temperature')
   Gr = NaN;
end
end