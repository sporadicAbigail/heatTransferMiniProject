function heatLoss = heatLossOutside(kWall, areaA, areaB, Tamb, Toutside)
    %This function calculates the heat loss outside of the two walls of the
    %room in units of watts
    %It returns a positive value
    heatLoss = kWall*areaA*(Tamb-Toutside)+kWall*areaB*(Tamb-Toutside);
end