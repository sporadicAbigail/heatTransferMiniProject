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

% variable that we solve for

exit = false;

while(exit == false)
    type = input("Free(1) or Forced(2) convection?");
    % got to be a much prettier way to write this
    % rip in matlab syntax
    if(type == 1)
        h = 10;
        exit = true;
    elseif(type == 2)
        h = 100;
        exit = true;
    else
        disp("Invalid input");
    end
end
% h should take type as an input argument, and then h sends that type to
% nusselt?

% v v v Bread and Butter v v v
qout = heatLossOutside(Kwall, A_WA, A_WB, Ti, To);
qdiff = @(Ts) (sig .* emmisv .* (Ts.^4 - Ti.^4)) + (h .* SAp .* (Ts - Ti)) - qout;
Tcalc1 = secantMethod(qdiff, 273, 373)
Tcalc2 = bisectionMethod(qdiff, 273, 373)

%{
x = linspace(273,373,100);
y = qdiff(x)
hold on
plot(x,y)
axis([0 100 -10 100])
xlabel('x'); ylabel('f(x)');
%}
%{
while 1
   % get input temperature
   % calculate t-dependent values
   % get temperature method by plugging energy balance into secant method
   % compare to heat loss outside, iterate tsurf until qpipe = qoutside
   % fxn(T) = qoutside, we compare the left to the right
   % q rad + q conv = q outside
   qconv = h * SAp * (Ts - Ti);
   qrad = sig * emmisv * (Ts^4 - Ti^4);
   qin = qconv + qrad;
   qdiff = @(Ts) (sig * emmisv * (Ts^4 - Ti^4)) + (h * SAp * (Ts - Ti)) - qout;
   
   Tcalc = secantMethod(qdiff);
   % and we return Tcalc
   % this approach asks for a pretty big function of h,
   % with a bunch of other functions nested inside
   
   % how to do this with secant method?
   % we want qin - qout to be 0, and this is a function of T
   % so we can plug in values of T until this error is less than 1
   % and end up not even bothering with this while loop
   
   secantMethod
   
   % this if statement gets the temperature 
   % to within a degree of the desired value
   % ASK: How to best narrow down temperature ranges?
   if(abs(qin - qout) > 1)
       if(qin > qout) % q too high
           Tsurf = Tsurf - 1;
       else % q too low
           Tsurf = Tsurf + 1;
       end
   else
       disp('Calculated values:\nTsurf = %f\n q = %f\n', Tsurf, qout);
       break;
   end
   % if greater, reduce Tsurf, if less, increase Tsurf
   break
end
%}
