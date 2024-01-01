# Vehicle-Dynamics-Testing: Lateral Motion
This repository contains a MATLAB code required to simulate and study the Lateral Vehicle Dynamics of an Autonomous vehicle using White-Box Test method. A CAN-Bus data file containing experimental data of a test-driven autonomous vehicle was used to simulate these results. A 2-DOF Bicycle Model was used to represent the system of the autonomous test vehicle in MATLAB.

# White Box Test (Code-Based Testing / Transparent Testing):
A White Box Test method looks at the code and internal structure of a system to be tested and uses that knowledge to perform the tests. It is most commonly used by software developers during Unit or Integration Testing Phase, to test the internal logic of a system. In order to execute this method, the tester must have extensive knowledge of the technology used to develop the program within the system. In other words, this method is well suited to test the internal algorithm of a system.

# Explanation of the files in the repository:
* "InputSA.xlsx" : Excel file containing values of Steering Angles of the test vehicle.
* "Inputspeed.xlsx" : Excel file containing values of Speed of the test vehicle.
* "OrgYawRate.xlsx" : Excel file containing measured values of Yaw Rate of the test vehicle.
* "LatDynTest.m" : MATLAB Code implementing White-Box Test Method on Lateral Vehicle Dynamics.
