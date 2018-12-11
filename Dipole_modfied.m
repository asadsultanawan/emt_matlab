%Dipole.m
%Start
%A simple interpretation
[X,Y]=meshgrid(-2:0.2:2,-3:0.2:3);%Defining a mesh grid
V = Y./(X.^2+Y.^2); %Electric field line equation
contour(X,Y,V,100);
[Ex,Ey]=gradient(V);
hold on
quiver(X,Y,-Ex,-Ey,'autoscalefactor',2);  
%end
