clc
clear all
close all

% PARAMETERS
L1 = 1; %m 
L2 = 0.2; %m
x_DC = 0.05; %m
y_DC = 0.6; %m


% CHECK THATH THE CRANK CAN MAKE A FULL ROTATION
full_rotation_check(L2, x_DC, y_DC);

theta1 = 0:1:360;
[m,n]=size(theta1);

% POSITION ANALYSIS
for i=1:n
    [s(i), theta3(i)] = positiom_analysis_byth1(theta1(i),L1,L2, x_DC, y_DC);
end

% VELOCITY ANALYSIS (considering theta1 with constant velocity)
rpm = 10;
for i=1:n
    th1_dot (i) = 2*pi*rpm/60; % rad/s
end

for i=1:n
    [s_dot(i), th3_dot(i)] = velocity_analysis_byth1(th1_dot(i), theta1(i), s(i), theta3(i), L1,L2, x_DC, y_DC);
end

% ACCELERATION ANALYSIS
for i=1:n
    th1_ddot(i) = 0; % rad/s
end

for i=1:n
    [s_ddot(i), th3_ddot(i)] = acceleration_analysis_byth1(th1_ddot(i), th1_dot(i), s_dot(i), th3_dot(i), theta1(i), s(i), theta3(i), L1,L2,x_DC, y_DC);
end


% TRANSMISSION RATIO
for i=1:n
    t_31(i) = th3_dot(i)/th1_dot(i);
end

figure
% posizione
subplot(3,2,1)
hold on
grid minor
plot(theta1,s,'b')
xlabel('th_1')
ylabel('s')
xlim([theta1(1) theta1(n)]);
ylim([mean(s)-1,mean(s)+1])

subplot(3,2,2)
hold on
grid minor
plot(theta1,theta3,'r')
xlabel('th_1')
ylabel('th_3')
xlim([theta1(1) theta1(n)]);
ylim([mean(theta3)-50,mean(theta3)+50])

%velocità
subplot(3,2,3)
hold on
grid minor
plot(theta1,s_dot,'b')
xlim([theta1(1) theta1(n)]);
xlabel('th_1')
ylabel('s dot')
ylim([mean(s_dot)-0.5,mean(s_dot)+0.5])
xL = xlim;
line(xL, [0 0],'Color','k');  %y-axis

subplot(3,2,4)
hold on
grid minor
plot(theta1,th3_dot,'r')
xlim([theta1(1) theta1(n)]);
xlabel('th_1')
ylabel('th_3 dot')
ylim([mean(th3_dot)-1,mean(th3_dot)+1])
xL = xlim;
line(xL, [0 0],'Color','k');  %y-axis

%accelerazione
subplot(3,2,5)
hold on
grid minor
plot(theta1,s_ddot,'b')
xlim([theta1(1) theta1(n)]);
xlabel('th_1')
ylabel('s ddot')
xL = xlim;
line(xL, [0 0],'Color','k');  %y-axis

subplot(3,2,6)
hold on
grid minor
plot(theta1,th3_ddot,'r')
xlim([theta1(1) theta1(n)]);
xlabel('th_1')
ylabel('th_3 ddot')
xL = xlim;
line(xL, [0 0],'Color','k');  %y-axis

% rapporto di trasmissione
figure
hold on
grid minor
plot(theta1,t_31,'r')
xlabel('th_1')
ylabel('t_{31}')
xL = xlim;
line(xL, [0 0],'Color','k');  %y-axis

%PLV: F^v_A + C^th1_dot=0
C = 1;
for i= 1:n
    v_Ax(i) = -L1*th1_dot(i)*sind(theta1(i));
    F(i) = -C*th1_dot(i)/(v_Ax(i));
end

figure
grid on
hold on
plot(theta1, F);
xlabel('th_1')
ylabel('F')
