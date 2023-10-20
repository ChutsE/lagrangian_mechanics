clear
clc
cla

% % Video
video = VideoWriter('video.avi');
video.Quality = 100;
open(video);

dt = 0.01;
L = 6;
R = 1;
g = 9.81;

theta = 0;
w = 0;

x_lim = [-3 6.5];
y_lim = [-6 1];

for k=1:5000
    
    alfa = (R*w^2+g*cos(theta))/(L-R*theta);
    w = w + alfa*dt;
    theta = theta + w*dt + 0.5*alfa*dt^2;
    
    x1 = R*sin(theta)+(L-R*theta)*cos(theta);
    y1 = -R*(1-cos(theta))-(L-R*theta)*sin(theta);
    
    x2 = R*sin(theta);
    y2 = -R*(1-cos(theta));
   
    viscircles([0 -R],R,'Color','black')
    %viscircles([x2 y2],0.05,'Color','black')
    viscircles([x1 y1],0.05,'Color','black')
    
    xlim( x_lim )
    ylim( y_lim )
    
    line( x_lim ,[0 0],'Color','red')
    line([0 0],[-.1 .1],'Color','red')
    
    line([x1 x2],[y1 y2],'Color','blue')
    %line([0 x1],[0 y1],'Color','blue')
    
    pause(0.01)

    frame = getframe(gcf);
    writeVideo(video,frame);

    line([x1 x2],[y1 y2],'Color','white')
    %line([0 x1],[0 y1],'Color','white')
    %viscircles([x2 y2],0.05,'Color','white')
    viscircles([x1 y1],0.05,'Color','white')
    
    
    

end

close(video);