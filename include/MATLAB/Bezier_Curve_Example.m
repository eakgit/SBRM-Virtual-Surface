clear
close all

t = linspace(0,1,101);


cla
xlim([0 50])
axis equal

pt1 = [ 5;-10];
pt2 = [13; -2];
pt3 = [ 5; 20];
pt4 = [25; 20];

placelabel(pt1,'pt_1');
placelabel(pt2,'pt_2');
placelabel(pt3,'pt_3');
placelabel(pt4,'pt_4');

pt5 = [45; 20];
pt6 = [35; -2];
pt7 = [43;-10];

placelabel(pt5,'pt_5');
placelabel(pt6,'pt_6');
placelabel(pt7,'pt_7');

pts1 = kron((1-t).^3,pt1) + kron(3*(1-t).^2.*t,pt2) + kron(3*(1-t).*t.^2,pt3) + kron(t.^3,pt4);
pts2 = kron((1-t).^3,pt4) + kron(3*(1-t).^2.*t,pt5) + kron(3*(1-t).*t.^2,pt6) + kron(t.^3,pt7);

hold on
p1 = plot(pts1(1,:),pts1(2,:),'r')
p2 = plot(pts2(1,:),pts2(2,:))
h = [p1(1);p2(1)];
line([pt1(1), pt2(1)],[pt1(2), pt2(2)]);
line([pt2(1), pt3(1)],[pt2(2), pt3(2)]);
line([pt3(1), pt4(1)],[pt3(2), pt4(2)]);
line([pt4(1), pt5(1)],[pt4(2), pt5(2)]);
line([pt5(1), pt6(1)],[pt5(2), pt6(2)]);
line([pt6(1), pt7(1)],[pt6(2), pt7(2)]);

title("Cubic Bezier curve")
legend(h,"(1-t)^{3}*pt_{1}+3(1-t)^{2}t*pt_{2}+3(1-t)t^{2}*pt_{3}+t^{3}*pt_{4}","(1-t)^{3}*pt_{4}+3(1-t)^{2}t*pt_{5}+3(1-t)t^{2}*pt_{6}+t^{3}*pt_{7}");
hold off

function placelabel(pt,str)
    x = pt(1);
    y = pt(2);
    h = line(x,y);
    h.Marker = '.';
    h = text(x,y,str);
    h.HorizontalAlignment = 'center';
    h.VerticalAlignment = 'bottom';
end