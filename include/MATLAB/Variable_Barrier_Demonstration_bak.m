%Variable Barrier Demonstration
%Egwuchukwu Kalu
%02/10/2024

x = [1 1];
y = [2 2];
r=[1,1.5];
hgt = [2 3];
th=0:pi/100:2*pi;
a1=r(1)*cos(th);
b1=r(1)*sin(th);

a2=r(2)*cos(th);
b2=r(2)*sin(th);
figure
surf([a1; a1]+x(1), [b1; b1]+y(1), [ones(1,size(th,2)); zeros(1,size(th,2))]*hgt(1), 'FaceColor','b', 'EdgeColor','none', 'FaceAlpha',1)
hold on
surf([a2; a2]+x(2), [b2; b2]+y(2), [ones(1,size(th,2)); zeros(1,size(th,2))]*hgt(2), 'FaceColor','r', 'EdgeColor','none','FaceAlpha',.3)
plot3(a1+x(1), b1+y(1), ones(1,size(th,2))*hgt(1), '-k')                  % Draws Circle Around Top Of Cylinder
plot3(a2+x(2), b2+y(2), ones(1,size(th,2))*hgt(2), '-k')                  % Draws Circle Around Top Of Cylinder
hold off
axis('equal')
view(45,30)
