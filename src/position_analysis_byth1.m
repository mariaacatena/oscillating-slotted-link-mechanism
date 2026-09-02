function [s theta3] = positiom_analysis_byth1(theta1, L1, L2, x_DC, y_DC)
    theta3 = atan2d(y_DC-L2*sind(theta1), x_DC - L2*cosd(theta1));
    s = sqrt(L2^2 + x_DC^2 + y_DC^2 - 2*L2*x_DC*cosd(theta1) - 2*L2*y_DC*sind(theta1));
end