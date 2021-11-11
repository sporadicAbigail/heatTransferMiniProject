function heatLoss = heatLossOutside(kWall, areaA, areaB, Tamb, Toutside, thickness)
    heatLoss = kWall*(areaA+areaB).*(Tamb-Toutside) ./ thickness;
end