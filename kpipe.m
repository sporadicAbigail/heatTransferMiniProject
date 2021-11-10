%{
This function calculates the thermal conductivity of a cast iron pipe (kp)in W/(m)(K)
as a function of surface temp Tsurf using the secant method and bisection 
method.
%}

function kp = kpipe(Tsurf)
kp1 = 51.2; %at 293K
kp2 = 46.4; %at 373K

%First for the secant method
if (293 <= Tsurf)&&(Tsurf <= 373)
    kp = lininterp(Tsurf,293,373,kp1,kp2);
else
   % This error term displays and returns not a number for kw.
    disp('Oops, one or both of the values you entered is outside the Temp range. Please try again.')
    kp = lininterp(Tsurf,0,0,0,0);
end
end