%{
This function outputs the momentum diffusivity for air (nua) in
m^2/s as a function of the surface temp Tsurf using the secant method and
bisection method.
%}
function nua = nuair(Tsurf)
nu1 = 1.2146e-5; %at T = 260K
nu2 = 1.3876e-5; %at T = 280K
nu3 = 1.5689e-5; %at T = 300K
nu4 = 1.7577e-5; %at T = 320K
nu5 = 1.9553e-5; %at T = 340K
nu6 = 2.1596e-5; %at T = 360K
nu7 = 2.5909e-5; %at T = 400K

if (260 <= Tsurf) && (Tsurf_s < 280)
    nua = lininterp(Tsurf,260,280,nu1,nu2);
    elseif (280 <= Tsurf) && (Tsurf < 300)
        nua = lininterp(Tsurf,280,300,nu2,nu3);
        elseif (300 <= Tsurf) && (Tsurf < 320)
            nua = lininterp(Tsurf,300,320,nu3,nu4);
            elseif (320 <= Tsurf) && (Tsurf < 340)
                nua = lininterp(Tsurf_s,320,340,nu4,nu5);
        elseif (340 <= Tsurf) && (Tsurf < 360)
            nua = lininterp(Tsurf,340,360,nu5,nu6);
    elseif (360 <= Tsurf) && (Tsurf <= 400) 
        nua = lininterp(Tsurf,360,400,nu6,nu7);
else
    %This error term displays and returns not a number for nua.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    nua = lininterp(Tsurf,0,0,0,0);
end
end