clc
close all
clear

th_vec=linspace(0,2*pi,50); %lemda
phi_vec = linspace(0,pi,50);

[th,phi] = meshgrid(th_vec,phi_vec);
X = sin(phi).*cos(th);
Y = sin(phi).*sin(th);
Z = cos(phi);

[Nx,Ny,Nz] = surfnorm(X,Y,Z);

X_offset = X + 10.*Nx;
Y_offset = Y + 10.*Ny;
Z_offset = Z + 10.*Nz;


%r = surf(X,Y,Z);
r_offset = surf(X_offset,Y_offset,Z_offset);
%surf(Nx,Ny,Nz)
axis equal