function [s_dot, th3_dot] = velocity_analysis_byth1(th1_dot, theta1, s, theta3, L1,L2, x_DC, y_DC);
    th3_dot = -L2*th1_dot*cosd(theta1-theta3)/s;
    s_dot = th3_dot*s*tand(theta3) + L2*th1_dot*sind(theta1)/cosd(theta3);
end