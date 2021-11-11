%%
%CHEN 3210 Mini-Project problem output code
% Constants %
% clear all;
clc;

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
A_WA = 15*8*(.0929);         %Area of wall A in m^2
A_WB = 20*8*(.0929);         %Area of wall B in m^2
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

% variable that we solve for

exit = false;

while(exit == false)
    type = input("Free(0) or Forced(1) convection?");
    if(type == 0)
        %h = 10;
        exit = true;
    elseif(type == 1)
        %h = 100;
        exit = true;
    else
        disp("Invalid input");
    end
end
% h should take type as an input argument, and then h sends that type to
% nusselt?

vel = 1;
material = 0; % 0 for air, 1 for water
%h = @(Ts) (kair(Ts) * nusseltCalc(reynoldCalc(1,Dopipe,nuair(Ts,Ti)),prandtlCalc(Ts,0),rayleighCalc(Grashof(Ts,Ts,Dopipe,Ti)),type) / Dopipe);
% ((kair(Ts) / Dopipe) * nusseltCalc(reynoldCalc(1,Dopipe,nuair(Ts,Ti)),prandtlCalc(Ts,0) ,rayleighCalc(Grashof(Ts,Ts,Dopipe,Ti)) ,type ))

%{
R = reynoldCalc(1,Dopipe,nuair(Ts,Ti));
P = prandtlCalc(Ts,0);
RA = rayleighCalc(Grashof(Ts,Ts,Dopipe,Ti));
T = type;
%}

% v v v Bread and Butter v v v
qout = heatLossOutside(Kwall, A_WA, A_WB, Ti, To, ThickW)
qdiff = @(Ts) (SAp * sig .* emmisv .* (Ts.^4 - Ti.^4)) + (((kair(Ts) / Dopipe) * nusseltCalc(reynoldCalc(1,Dopipe,nuair(Ts)),prandtlCalc(Ts,0) ,rayleighCalc(Grashof(Ts,Dopipe,Ti), prandtlCalc(Ts,0)) ,type )) .* SAp .* (Ts - Ti)) - qout;
Tcalc1 = secantMethod(qdiff, 273, 373)
Tcalc2 = bisectionMethod(qdiff, 273, 373)

% Question D

qradD = (sig .* emmisv .* (Tcalc1.^4 - Ti.^4))
qconvD = (((kair(Tcalc1) / Dopipe) * nusseltCalc(reynoldCalc(1,Dopipe,nuair(Tcalc1)),prandtlCalc(Tcalc1,0) ,rayleighCalc(Grashof(Tcalc1,Dopipe,Ti), prandtlCalc(Tcalc1,0)) ,type )) .* SAp .* (Tcalc1 - Ti))
fractionrad = (qradD) / (qradD + qconvD)
fractionconv = 1- fractionrad

% Question E

deltaT = qout / 1 / lininterp(Tcalc1,293,313,4182,4175)
