function []=Miniproject_constants()
global Di Lp Thp epsilon Kw Thw Tin Tout 
Dpipe = 4/100;      %inside pipe diameter in meters
Lpipe = 5;          %pipe length in meters
ThickP = 0.25/100;  %pipe thickness in meters
emmisv = 0.81;      %cast iron pipe emmisivity
Kwall = 0.075;      %themral conductivity of wall in W/((m)(k))
ThickW = 0.3;       %wall thickness in meters
Ti = 25 + 273.15;   %inside temp in K
To = -10 + 273.15;  %outside temp in K

Di = Dpipe;
Lp = Lpipe;
Thp = ThickP;
epsilon = emmisv;
Kw = Kwall;
Thw = ThickW;
Tin = Ti;
Tout = To;
end