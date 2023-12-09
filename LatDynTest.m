%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Vishesh Sadananda Babu, Last update: 09/12/2023
% Description:
% * White-Box modelling to test Lateral Vehicle Dynamics of Autonomous test Vehicle
% * MATALAB code represents an elementary 2DOF Bicycle model of an automobile which takes into account - Yaw & Lateral speed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Model Parameters
m = 1677;          % Mass of the vehicle (kg)
V_x = 18;          % Intial velocity (m/s)
L = 2.4;           % Distance between front and rear axles (m)
I_z = 2562;        % Moment of inertia of the vehicle (kgm2)
l_f = 1.2;         % Distance from centre of mass to the front axle (m)
l_r = 1.2;         % Distance from centre of mass to the rear axle (m)
c_f = 260000;      % Cornering stiffness of the front tire (kgm/s2)
c_r = 220000;      % Cornering stiffness of the rear tire (kgm/s2)

%% Simulink model Variables Decleration
L =  2.4;
Iz = 2562;
lf = 1.2;
lr = 1.2;
Cf = 260000;
Cr = 220000;

s = tf('s');
steering_time_constant = 0.2;
steering_tf = 1/(steering_time_constant*s + 1)^2;

SA_new =  readmatrix('InputSA.xlsx');
yawrate_new =  readmatrix('OrgYawRate.xlsx');
speed_new = readmatrix('Inputspeed.xlsx');

%% Dynamic 2DOF Bicycle model equations
% Continous A B C D matrixes

%% Matrix A: System Matrix
A = [0 1 Vx 0; 0 -2*(c_f+c_r)/(m*v_x) 0 -2*(l_f*c_f + l_r*c_r)/(m*v_x) - v_x;
     0 0 0 1; 0 2*(l_r*c_r - l_f*c_f)/(I_z*v_x)  0  -2*(l_r^2*c_r - l_f^2*c_f)/(I_z*v_x)];

 %% Matrix B: Input Matrix
B = [0 ; 2*c_f/m ; 0 ; 2*l_f*c_f/I_z];

%% Matrix C: Lateral speed
C= [1 0 0 0 ; 0 1 0 0];

%% Matrix D: Yaw rate
D = [0;0];

vehicle = ss(A,B,C,D)

%tRef = [1:0.1:327.2]';
sim_time = 300;% simulation time 
% sim_time =65 ; % simulation time 
s = size(SA_new);

tRef = (linspace(0,sim_time,s(1)))'; % this time variable is used in the "2D Visualization" block for plotting the reference points. 

X_o = 501.550682768;
Y_o = 316.00693143;

hold on 

% figure(1)
% a_5 = out.x_global_5(:,1);
% b_5 = out.y_global_5(:,2);
% A_5 = plot(a_5,b_5)
% A_5.LineWidth = 1.5;
% A_5.Color = [0 0 1]
% xlabel('time (sec)','FontSize',11)
% ylabel('Given yaw rate (rad/s)','FontSize',11)
% title('Plot of the given yaw rate','FontSize',11)

% figure(1)
% a = out.steering_input(:,1);
% b = out.steering_input(:,2);
% A = plot(a,b)
% A.LineWidth = 1.5;
% A.Color = [0 0 1]
% xlabel('time (sec)','FontSize',11)
% ylabel('Steering Input (rad)','FontSize',11)
% title('Plot of the Steering angle input','FontSize',11)
% 
% hold on
% 
% figure(2)
% a_2 = out.velocity_input(:,1);
% b_2 = out.velocity_input(:,2);
% A_2 = plot(a_2,b_2)
% A_2.LineWidth = 1.5;
% A_2.Color = [0 0 1]
% xlabel('time (sec)','FontSize',11)
% ylabel('Velocity Input (m/s)','FontSize',11)
% title('Plot of the Velocity input','FontSize',11)
% 
hold on
% 
figure(3)
a_3 = out.yawrate_output(:,1);
b_3 = out.yawrate_output(:,2);
A_3 = plot(a_3,b_3);
A_3.LineWidth = 1.5;
A_3.Color = [0 0 1];
xlabel('time (sec)','FontSize',11)
ylabel('Yawrate output (rad/s)','FontSize',11)
title('Plot of the Yawrate Output','FontSize',11)

% hold on
% 
% figure(4)
% a_4 = out.lateralvelocity_output(:,1);
% b_4 = out.lateralvelocity_output(:,2);
% A_4 = plot(a_4,b_4)
% A_4.LineWidth = 1.5;
% A_4.Color = [0 0 1]
% xlabel('time (sec)','FontSize',11)
% ylabel('Lateral Velocity output (m/s)','FontSize',11)
% title('Plot of the Lateral Velocity Output','FontSize',11)

hold on 

figure(5)
a_5 = out.givenyawrate_5(:,1);
b_5 = out.givenyawrate_5(:,2);
A_5 = plot(a_5,b_5);
A_5.LineWidth = 1.5;
A_5.Color = [0 0 1];
xlabel('time (sec)','FontSize',11)
ylabel('Given yaw rate (rad/s)','FontSize',11)
title('Plot of the given yaw rate','FontSize',11)

hold on

figure(6)
plot(a_3,b_3,a_5,b_5)
xlabel('time (sec)','FontSize',11)
ylabel('Combined yaw rate(rad/s)','FontSize',11)
title('Plot of the given yaw rate(red) and simulated yaw rate(Blue)','FontSize',11)
a_3.Color = [0 0 1];
a_5.Color = [1 0 0];

%xRef = waypoints(:,1);
%yRef = waypoints(:,2);
%Ld = 10; %Lookahead distance
