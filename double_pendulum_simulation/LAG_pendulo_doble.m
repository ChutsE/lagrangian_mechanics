clear
clc
cla

% % Video
% video = VideoWriter('video.avi');
% video.Quality = 100;
% open(video);

dt = 0.01;
r = 2;
R = 2;
g = 10;
m1 = 1;
m2 = 2;
M = m2/(m1+m2);

theta1 = pi/2;
theta2 = pi/2;
w1 = 0;
w2 = 0;
alfa1 = 0;
alfa2 = 0;

dtheta = theta1-theta2;

for k=1:500

    alfa1 = -M*(r/R)*[alfa2*cos(dtheta)+w2^2*sin(dtheta)]-g/R*sin(theta1);
    alfa2 = -(R/r)*[alfa1*cos(dtheta)-w1^2*sin(dtheta)]-g/r*sin(theta2);
    
    w1 = w1 + alfa1 * dt;
    w2 = w2 + alfa2 * dt;
    
    theta1 = theta1 + w1*dt + 0.5*alfa1 * dt^2;
    theta2 = theta2 + w2*dt + 0.5*alfa2 * dt^2;
  
    x1 = R*sin(theta1);
    y1 = -R*cos(theta1);
    
    x2 = R*sin(theta1)+ r*sin(theta2);
    y2 = -R*cos(theta1)-r*cos(theta2);
   
    viscircles([x2 y2],0.05,'Color','black')
    viscircles([x1 y1],0.05,'Color','black')
    
    xlim([-4 4])
    ylim([-4 3])
    
    line([-3 3],[0 0],'Color','red')
    line([0 0],[-.1 .1],'Color','red')
    
    line([x1 x2],[y1 y2],'Color','blue')
    line([0 x1],[0 y1],'Color','blue')
    
    pause(0.0001)

%     frame = getframe(gcf);
%     writeVideo(video,frame);

    line([x1 x2],[y1 y2],'Color','white')
    line([0 x1],[0 y1],'Color','white')
    viscircles([x2 y2],0.05,'Color','white')
    viscircles([x1 y1],0.05,'Color','white')
    
    
    

end

% close(video);