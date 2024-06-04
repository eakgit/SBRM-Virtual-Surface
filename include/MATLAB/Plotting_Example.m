%2023/09/09

t = -100:0.01:100;
xt = 3*t;
yt = 3*(t.^2);
zt = 2*(t.^3);

x1 = t;
y1 = 0*t;
z1 = t;

plot3(xt,yt,zt);

hold on

plot3(x1,y1,z1);
title('Graph of (3t,3t^{2},2t^{3}) and (t,0,t)')
xlabel('x(t)')
ylabel('y(t)')
zlabel('z(t)')


axis square