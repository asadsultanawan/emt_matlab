%Capacitor.m
%Start
clc
close all
clear all
% Setting up Parameters:
a = 1;  %Unit Radius of circular plate
d = 1;  % Unit Distance between plates.
V = 50;  % Voltage across plates.

% Setting up a grid for plotting:
x = -2:0.1:2;
y = -2:0.1:2;
[X, Y] = meshgrid(x, y);
figure
axis([-2 2 -2 2])

% Electric field potential (approximation):
Q= (2*V/pi)* ...
     (asin(2*a./(sqrt((Y-d/2).^2 + (X-a).^2) + sqrt((Y-d/2).^2 + (X+a).^2))) ...
    - asin(2*a./(sqrt((Y+d/2).^2 + (X-a).^2) + sqrt((Y+d/2).^2 + (X+a).^2))));

% Plot the equipotential lines using contour function  
contour(X, Y, Q, 20, 'LineWidth', 2)
hold on

% Compute and plot the electric field:
[Ex, Ey] = gradient(Q, 0.1);%Electric Field is negative gradient of potential 
quiver(X, Y, Ex, Ey)% For displaying small arrows

% Drawing  the parallel plate capacitor:
line('XData', [-a a],'YData', [d/2, d/2], 'Color', 'b', 'LineWidth', 3)
line('XData', [0 0],'YData', [d/2, 3], 'Color', 'b', 'LineWidth', 3)
line('XData', [-a a],'YData', [-d/2, -d/2], 'Color', 'r', 'LineWidth', 3)
line('XData', [0 0],'YData', [-3, -d/2], 'Color', 'r', 'LineWidth', 3)
legend('Equipotential Surface','Electric Field')
title('Plot of Equipotential & Electric Field of a Capacitor')

%end
