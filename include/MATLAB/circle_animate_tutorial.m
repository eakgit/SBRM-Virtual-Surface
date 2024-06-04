clc
close all
clear all

theta = linspace(-pi,pi,50000);
xc = cos(theta);
yc = -sin(theta);
plot(xc,yc);
axis equal

xt = [-1 0 1 -1];
yt = [0 0 0 0];
hold on
t = area(xt,yt); % initial flat triangle
hold off
for j = 1:length(theta)
    xt(2) = xc(j); % determine new vertex value
    yt(2) = yc(j);
    t.XData = xt; % update data properties
    t.YData = yt;
    drawnow limitrate % display updates
end
