function [s_ddot, th3_ddot] = acceleration_analysis_byth1(th1_ddot, th1_dot, s_dot, th3_dot, theta1, s, theta3, L1,L2,x_DC, y_DC);
    a1 = -2*s_dot*th3_dot*sind(theta3) - s*th3_dot^2*cosd(theta3) - L2*th1_ddot*sind(theta1) - L2*th1_dot^2*cosd(theta1);
    a2 = 2*s_dot*th3_dot*cosd(theta3) - s*th3_dot^2*sind(theta3) + L2*th1_ddot*cosd(theta1) - L2*th1_dot^2*sind(theta1);
    
    th3_ddot = (a1*sind(theta3) - a2*cosd(theta3))/s;
    s_ddot = s*tand(theta3)*th3_ddot-a1/cosd(theta3);
end