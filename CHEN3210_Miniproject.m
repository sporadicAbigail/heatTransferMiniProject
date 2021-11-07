%%
%CHEN 3210 Mini-Project problem output code
% Constants %
Dipipe = 4/100;                 %inside pipe diameter in meters
Lpipe = 5;                      %pipe length in meters
ThickP = 0.25/100;              %pipe thickness in meters
Dopipe = Dipipe + 2*ThickP;     %outside pipe diameter in meters
emmisv = 0.81;                  %cast iron pipe emmisivity
Kwall = 0.075;                  %themral conductivity of wall in W/((m)(k))
ThickW = 0.3;                   %wall thickness in meters
Ti = 25 + 273.15;               %inside temp in K
To = -10 + 273.15;              %outside temp in K
sig = 5.676e-8;                 %stefan-boltzman constant in W/((m)^2(K)^4) 
SAp = pi()*Dopipe*Lpipe;        %Surface area of the pipe in m^2
g = 9.81;                       %acceleration due to gravity in m/s^2
A_WA = 15*8*(1/10.764);         %Area of wall A in m^2
A_WB = 20*8*(1/10.764);         %Area of wall B in m^2
%%
% Calculate Re, Nu, Pr, Ra other constants
% as well as Gr, kfluid, kROUGHCASTIRON, nu, and h
% do not need alpha, beta

% This is the master file that will use all input functions.

%{
Use energy balance as the function to iterate over for Tsurf (2 guess).
Solve for all the constants that vary with temp (beta, alpha etc.)
Then solve for h if correct then stop, if not iterate in a while loop.
%}

% PLAB
% get master file that calls other functions
%  - declare constants at top
%  - get initial guesses for temperatures, calculate values
%  - perform secant method iteration to solve for Tsurf
%       - while loop, calculate Tsurf, recalculate values
%       - hold previous Tsurf until error is small?

% variables that we solve for
h = 1;

while 1
   % get input temperature
   % calculate t-dependent values
   % get temperature method by plugging energy balance into secant method
   % compare to heat loss outside, iterate tsurf until qpipe = qoutside
   % fxn(T) = qoutside, we compare the left to the right
   % q rad + q conv = q outside
   qconv = h * A * (Ts - Ti);
   qrad = 
   qin = qconv + qrad;
   
   if(abs(qin - qout) > 1)
       
   end
   % if greater, reduce Tsurf, if less, increase Tsurf
   break
end
