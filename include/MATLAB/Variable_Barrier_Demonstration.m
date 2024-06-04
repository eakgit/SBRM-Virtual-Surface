%Variable Barrier Demonstration
%Egwuchukwu Kalu
%02/10/2024


r0 = 1.5;
rN = 1;
N = 50;

arr = linspace(rN,r0,N);

[X1,Y1,Z1,x1,y1,z1] = Cylinder(1,2,1,2);
frames = [fliplr(arr) arr];


figure
h1 = surf(X1,Y1,Z1,'FaceColor','b', 'EdgeColor','none', 'FaceAlpha',1);
hold on 
h2 = plot3(x1,y1,z1, '-k');
F = cell(length(frames),1);
for i = 1:length(frames)
    [X2,Y2,Z2,x2,y2,z2] = Cylinder(frames(i),2,1,2);
    h3 = surf(X2,Y2,Z2, 'FaceColor','r', 'EdgeColor','none','FaceAlpha',.3);
    h4 = plot3(x2,y2,z2, '-k');
    drawnow
    axis([-1 4 -1 4 0 3])
    view(45,30)
    pause(0.1)
    title("Variable Barrier Concept Demonstration") 
    F{i} = getframe(gcf);
    if i ~= length(frames)
        delete(h3)
        delete(h4)
    end
end

obj = VideoWriter("Variable Barrier Demonstration.avi");
obj.Quality = 100;
obj.FrameRate = 10;
open(obj);
for i = 1:length(F)
    writeVideo(obj, F{i}) ;
end
obj.close();

function [X,Y,Z,x,y,z] = Cylinder(r,h,x_cnt,y_cnt)
    th=linspace(0,2*pi,1000);
    x1=r*cos(th);
    y1=r*sin(th);

    
    X = [x1; x1]+x_cnt;
    Y = [y1; y1]+y_cnt;
    Z = [ones(1,size(th,2)); zeros(1,size(th,2))]*h;
    x = x1+x_cnt;
    y = y1+y_cnt;
    z = ones(1,size(th,2))*h;
end
