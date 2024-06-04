clear
close all
n = input("Enter the number of interval to use for the curve: ");
r = input("Enter the scaling factor for the offset curve: ");
if (n < 3)
    n = 3;
end

tvec = linspace(-2*pi,2*pi,n+1);

t = sym("t",[1 length(tvec)]);
syms c(t) s(t);
c(t) = cos(t);
s(t) = sin(t);


dcdt = diff(c,t);
dsdt = diff(s,t);

x = double(c(tvec));
y = double(s(tvec));
sqr = sqrt(dsdt.^2+dcdt.^2);
x_ = double(c(tvec)-(r*dsdt(tvec)./sqrt(dcdt(tvec).^2+dsdt(tvec).^2)));
y_ = double(s(tvec)+(r*dcdt(tvec)./sqrt(dcdt(tvec).^2+dsdt(tvec).^2)));



figure(1)
hold on
title("Offset Curve of a Parabola")
plot(x,y)
plot(x_,y_)
legend("Original Curve","Offset Curve");
axis equal
