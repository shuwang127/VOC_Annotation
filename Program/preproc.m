function preproc()
% pre-process the images in the _cache file into the JPEGImages files.
% resize and resigned
% Written by Shu Wang
%

%%
clear all;
close all;
clc;

%%
input_path = '../_cache/';
output_path = '../JPEGImages/';
files = img_dir(input_path);
%idx = 1:length(files);
disp(['There are totally ', num2str(length(files)), ' images..']);

%%
NUMSTART = 000001;
randomnum = randperm( length(files) );

for i = 1:length(files)

    %% read image
    img = imread(files(i).name);
    
    %% cut
    %x1 = 165;   x2 = 1755;
    %y1 = 1;     y2 = 1075;
    %img = img(y1:y2,x1:x2,:);
    
    %% resize
    [ysize,xsize,~] = size(img);
    x = 600; 
    y = round(ysize * x / xsize);
    img = imresize(img,[y x],'bicubic');
    
    %% write
    savepath = [output_path, num2str(NUMSTART+randomnum(i)-1,'%06d'), '.jpg'];
    imwrite(img,savepath);
    
end

end

