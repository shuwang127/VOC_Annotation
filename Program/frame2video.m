clear all;
close all;

%% set path
video_name = 'video/Matlab_FRCNN.avi';
frame_path = 'frames/';

%% 
obj = VideoWriter(video_name);
obj.FrameRate = 30;
open(obj);
for k = 1 : 265
    frame_name = strcat(frame_path, num2str(k,'%06d'), '.jpg');
    frame = imread(frame_name);
    writeVideo(obj, frame);
end
close(obj)
