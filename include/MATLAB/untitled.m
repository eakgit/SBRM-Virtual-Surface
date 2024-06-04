    r0 = 1 ;
    r1 = 0.1 ;
    N = 50 ;
    rr = linspace(r1,r0,N) ;
    R = [fliplr(rr) rr] ;
    for i = 1:length(R)
        [X,Y,Z] = Sphere(R(i)) ;
        surf(X,Y,Z) ;
        shading interp ;
        drawnow
        axis([-1 1 -1 1 -1 1])
        pause(0.1)
    end   
function [x,y,z] = Sphere(r)
phi=linspace(0,pi,30);
theta=linspace(0,2*pi,40);
[phi,theta]=meshgrid(phi,theta);
x=r*sin(phi).*cos(theta);
y=r*sin(phi).*sin(theta);
z=r*cos(phi);
end