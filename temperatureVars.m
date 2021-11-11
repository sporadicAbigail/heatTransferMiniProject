% takes temperature input in Kelvin



function ret = temperatureVars(tsurf, tamb)

T1 = 280;
T2 = 360;

Pr1 = 0.713;
Pr2 = 0.695;

beta = 1/((tsurf + tamb)/2);

% alpha values of air, from text
% @ 280K, α = 1.9448 * 10^(-5) m^2/s
% @ 300K, α = 2.2156 * 10^(-5) m^2/s
% @ 320K, α = 2.5003 * 10^(-5) m^2/s
% alpha = 

Pr = linterp(tsurf,T1,T2,Pr1,Pr2);

ret = Pr;

%nu

%kfluid

%kpipe

end