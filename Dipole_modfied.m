%Dipole.m
%Start
%A simple interpretation
[X,Y]=meshgrid(-10:.5:10,-10:.5:10);%Defining a mesh grid
V = Y./(X.^2+Y.^2); %Electric field line equation
contour(X,Y,V,50,'linewidth',1.5);
[Ex,Ey]=gradient(V);
hold on
quiver(X,Y,-Ex,-Ey,'linewidth',1.5,'autoscalefactor',2);  
%end
