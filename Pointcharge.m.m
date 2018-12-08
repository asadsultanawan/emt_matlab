%Pointcharge.m
%Equipotential Plot of a point charge
%Start
clear all
close all
clc

k = 8.987E9; % Coulomb's constant
Q = 20e-6;%An arbitrary charge of 6uc
[X,Y] = meshgrid(-10:10); % Create a grid of coordinates where V is to be calculated

V = k*Q./sqrt(X.^2+Y.^2);%Formula of Potential
hContour = contourf(X,Y,V,20);%Contour Plot
ylabel('Electric potential (V)','Fontsize',18)

[Ex,Ey] = gradient(V,0.1);
validColumns = all(isfinite(Ex) & isfinite(Ey)); % Ignore columns where E contains infinite values due to the point charges since streamslice can't handle them
hold on
hLines = streamslice(X(:,validColumns),Y(:,validColumns),Ex(:,validColumns),Ey(:,validColumns));%streamslice(X,Y,U,V)
set(hLines,'Color','r');
legend('Equipotential Surface','Electric Field')
title('Plot of Equipotential & Electric Field of a Point Charge')
clear all

%end
