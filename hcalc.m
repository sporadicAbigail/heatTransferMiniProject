%{
This function calculates the heat transfer coefficient (h) in W/(m^2)(K) as a function of the
nusselt number (Nus) for either free,forced external or forced internal
convection, the diamater of the pipe (Dpipe) which is Dopipe (for external flows) or Dipipe
(for interanl flows) and the thermal conductivity of the fluid (kf) which
in this case is either air or water.
%}

function h = hcalc(Nus, Dpipe, kf)
%Remember to use the correct diamater and thermal conductivity for this
%calculation to ensure that the heat transfer coefficient is correct for
%interal flow, external forced convection and external free convection.

h = (Nus*kf)/Dpipe;
end