clear
clc
cla

% Video
video = VideoWriter('video.avi');
video.Quality = 100;
open(video);

dt = 0.01;
r = 1;
g = 10;
m = 1;
M = 1;
u=0.1;

x = 0;
v = 0;
a = 0;
w = 0;
alfa=0;
theta = pi/2;% pi/2 - 0.1;

for k=1:1000
    
    alfa = -(a/r)*cos(theta)-(g/r)*sin(theta);
    
    if v>0
        a = -(m/(m+M))*r*(alfa*cos(theta)-w^2*sin(theta))-g*u;
    end
    if v<0
        a = -(m/(m+M))*r*(alfa*cos(theta)-w^2*sin(theta))+g*u;
    end
    if v==0
        a = -(m/(m+M))*r*(alfa*cos(theta)-w^2*sin(theta))
    end
    
    
    
    w = w + alfa * dt;
    theta = theta + w*dt + 0.5*alfa * dt^2;
    
    v = v + a*dt;
    x = x + v*dt + 0.5*a*dt^2;
    
    x1 = x;
    y1 = 0;
    
    x2 = x + r*sin(theta);
    y2 = -r*cos(theta);
   
    viscircles([x2 y2],0.05,'Color','black')
    viscircles([x1 y1],0.05,'Color','black')
    
    xlim([-2 2])
    ylim([-2 2])
    
    line([-2 2],[0 0],'Color','red')
    line([0 0],[-.3 .3],'Color','blue')
    line([x1 x2],[y1 y2],'Color','blue')
    
    pause(0.0001)

    frame = getframe(gcf);
    writeVideo(video,frame);

    line([x1 x2],[y1 y2],'Color','white')
    viscircles([x2 y2],0.05,'Color','white')
    viscircles([x1 y1],0.05,'Color','white')

end

close(video);