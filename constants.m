% this function contains all of the constants
% used for calculations throughout the problem

% how can i get these to be global variables
function ret = constants()

% inner diameter, m
din = 0.04;
% pipe thickness, m
pthick = 0.0025;
% outer diameter, m
dout = din + 2 * pthick;
% pipe emissivity, unitless
epsilon = 0.81;
% thermal conductivity, outside wall, W/(m*K)
kwall = 0.075;
% wall thickness
wthick = 0.3;
% inlet temperature, kelvin
tin = 25 + 273.15;
% outlet temperature, kelvin
tout = -10 + 273.15;

% wall dimensions, m
width = 15 * 0.3048;
length = 20 * 0.3048;
height = 8 * 0.3048;

ret = [din pthick dout epsilon kwall wthick tin tout width length height];

end
