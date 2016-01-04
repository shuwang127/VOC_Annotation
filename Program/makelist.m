function [ output_args ] = makelist( input_args )
% This program is aim to make a train image list for caffe.
% Written by Shu Wang
%

%%
clear all;
close all;
clc;

%%
input_path = '../JPEGImages/';
files = img_dir(input_path);
output_path = '../ImageSet/Main/';
listfile = [output_path,'trainlist.txt'];
disp(['There are totally ', num2str(length(files)), ' images..']);

%%
fp = fopen(listfile, 'w');

for i = 1:length(files)
    fprintf(fp,files(i).name(end-9:end-4));
    if i == length(files)
        break;
    end
    fprintf(fp,'\n');
end

fclose(fp);
disp(['finish!']);

end

