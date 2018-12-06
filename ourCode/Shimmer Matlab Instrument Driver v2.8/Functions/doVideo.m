
function result = doVideo()
%%plays the video 'tw4802.m4v' located in the 'media' folder 
figure(2);
vidObj = VideoReader('Canada-project/media/tw4802.m4v')
vidObj.CurrentTime = 0.1;
% Create an axes
currAxes = axes;
% Read video frames until available
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    pause(1/vidObj.FrameRate);
end
end
