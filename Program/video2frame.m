clear all;
close all;

%% set path
video_name = 'Videos/VID_20160106_111236.mp4';
frame_path = 'Results/';

%% 
obj = VideoReader(video_name);
numFrames = obj.NumberOfFrames;
for k = 1 : numFrames
    frame = read(obj, k);
    save_path = strcat(frame_path,num2str(k,'%06d'));
    imwrite(frame, strcat(save_path,'.jpg'));
end
