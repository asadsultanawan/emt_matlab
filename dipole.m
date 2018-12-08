clear all
clc
close all
%dipole.m
%Dipole Field and Potential
%start
%Figure properties
   axis([-4 4 -5 5]); axis equal;
   ylabel('Electric Potential','Fontsize',18);
   hold on;

%--Negative contours
   cont    = zeros(9,1);
   cont(1) = 0.05;
   step    = 0.02;
   for counter=1:9
      cont(counter+1) = cont(counter) + step;
      step      = step*1.5;
   end
   cont = -100*cont; cont=round(cont); cont=cont/100;
   %Setting up x grid
   x = [-3.5 : .05 :  3.5];
   %Negative y-grid
   y = [-5 : .05 :  -.05];


%--Plot below x-axis
   [X,Y] = meshgrid(x,y);
   P     = Y./(sqrt(X.^2+Y.^2).^3);  %Function
   [C,h] = contour(X,Y,P, cont, 'b' );
   clabel(C,h);
   
%--Flip signs
   y   = -y;
   cont = -cont;

%--Plot above x-axis
   [X,Y] = meshgrid(x,y);%Setting up meshgrid
   P     = Y./(sqrt(X.^2+Y.^2).^3);  %Function 
   [c,h] = contour(X,Y,P, cont, 'r');
   clabel(c,h);
   
  legend('Upper Lobe','Lower Lobe','Location','best')
  title('Plot of Equipotential & Electric Field of a Dipole')
  
  %end
   