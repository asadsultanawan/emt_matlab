%Pointcharge.m
%Equipotential Plot of a point charge
%Start
close all
clc

k = 8.99e9; % Coulomb's constant
Q = 20e-6;%An arbitrary charge of 6uc
a = k*Q;
disp(a)
[X,Y] = meshgrid(-10:0.5:10); % Create a grid of coordinates where V is to be calculated

V = a./sqrt(X.^2+Y.^2);%Formula of Potential
contour(X,Y,V,40); %Contour Plot
ylabel('Electric potential (V)','Fontsize',18)

[Ex,Ey] = gradient(V,0.2,0.2);
Ex=-Ex;
Ey=-Ey;
validColumns = all(isfinite(Ex) & isfinite(Ey)); % Ignore columns where E contains infinite values due to the point charges since streamslice can't handle them
hold on
hLines = streamslice(X(:,validColumns),Y(:,validColumns),Ex(:,validColumns),Ey(:,validColumns));%streamslice(X,Y,U,V)
set(hLines,'Color','b');
legend('Equipotential Surface','Electric Field')
title('Plot of Equipotential & Electric Field of a Point Charge')

%end
