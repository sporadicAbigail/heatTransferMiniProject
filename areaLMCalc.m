function areaLogMean = areaLMCalc(length,diameterOuter,diameterInner)
    % Find area log mean for a cylinder
    surfaceAreaOutside = 2*pi()*diameterOuter/2*length;
    surfaceAreaInside = 2*pi()*diameterInner/2*length;
    areaLogMean = (surfaceAreaOutside-surfaceAreaInside)/(log(surfaceAreaOutside/surfaceAreaInside));
end