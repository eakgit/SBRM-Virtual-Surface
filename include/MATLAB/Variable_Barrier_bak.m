%Variable_Barrier.m
%02/13/2024
%Egwuchukwu Kalu

clc
clear
close all


n = input("Enter the number of interval to use for the curve: ");
r = input("Enter the scaling factor for the offset curve: ");

uinf = input("Enter the lower bound of the u variable: ");
usup = input("Enter the upper bound of the u variable: ");

vinf = input("Enter the lower bound of the v variable: ");
vsup = input("Enter the upper bound of the v variable: ");


if (n < 3)
    n = 3;
end

u_vec = linspace(uinf,usup,n+1);
v_vec = linspace(vinf,vsup,n+1);

u = sym("u",[1 length(u_vec)]);
v = sym("v",[1 length(v_vec)]);

 %Symbolic parametric variables for 3D surface
syms x(u,v) y(u,v) z(u,v) %Symbolic 3D coordinates
xfunc = input("Enter x as a function of variables u and v: ","s");
yfunc = input("Enter y as a function of variables u and v: ","s");
zfunc = input("Enter z as a function of variables u and v: ","s");

x(u,v) = str2sym(xfunc); 
y(u,v) = str2sym(yfunc);
z(u,v) = str2sym(zfunc);



