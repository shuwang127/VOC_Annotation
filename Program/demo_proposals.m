%% clear all
clear all;
close all;
clc;

%% compile the basic code
addpath('_Make_Proposals');
% Compile anisotropic gaussian filter
if(~exist('anigauss'))
    mex anigaussm/anigauss_mex.c anigaussm/anigauss.c -output anigauss
end
% Compile the code of Felzenszwalb and Huttenlocher, IJCV 2004.
if(~exist('mexFelzenSegmentIndex'))
    mex FelzenSegment/mexFelzenSegmentIndex.cpp -output mexFelzenSegmentIndex;
end

%% Setting Parameters
colorTypes = {'Rgb', 'Hsv', 'RGI', 'Opp'};
% Thresholds for the Felzenszwalb and Huttenlocher segmentation algorithm.
% Note that by default, we set minSize = k, and sigma = 0.8.
kThresholds = [100 200]; 
sigma = 0.8;
numHierarchy = length(colorTypes) * length(kThresholds);

%% As an example, use a single Pascal VOC image
input_path = '../JPEGImages/';
source = init_source(input_path);
images_num = size(source.files,1);
save_path = '../SelectiveSearchData/';
% save_path = '../SelectiveSearchData/car_2015_train.mat';

%%
% if(~exist(save_path))
%     boxes = [];
%     images = [];
%     istart = 1;
% else
%     load(save_path);
%     istart = length(images) + 1;
%     if (length(images) == images_num)
%         fprintf('Finish the process\n');
%         break;
%     end
% end

mat_file = dir(save_path);
mat_num = size(mat_file,1)-2;

% For each image do Selective Search
fprintf('Performing selective search: \n');

% boxes = cell(1, length(images));
for i = (mat_num+1):images_num
    bbox = [];
    idx = 1;
    currBox = cell(1, numHierarchy);
    im_path = source.files(i).name
    im = imread(im_path);
    for k = kThresholds % [100 200]
        minSize = k; % We use minSize = k.
        for colorTypeI = 1:length(colorTypes) % 1:4
            colorType = colorTypes{colorTypeI};
            currBox{idx} = SelectiveSearch(im, sigma, k, minSize, colorType);
            idx = idx + 1;
        end
    end
    
    bbox = cat(1, currBox{:});
    bbox = unique(bbox, 'rows');
    boxes = bbox(:,[2,1,4,3])-1;

    % boxes{i} = bbox;
    % images{i,1} = source.files(i).name(end-9:end-4);
    
    % save(save_path, 'boxes', 'images');
    savemat_path = strcat(save_path, num2str(i,'%06d'));
    save(strcat(savemat_path, '_boxes'), 'boxes');
end

%%
num_train = 10000;
save_train_path = '../SelectiveSearchData/car_2015_train.mat';
fprintf('Performing training selective search data: \n');
for i = 1:num_train
    savemat_path = strcat(save_path, num2str(i,'%06d'));
    load(strcat(savemat_path, '_boxes'), 'boxes');
    boxes = boxes(:,[2,1,4,3])+1;
    boxes_cell{i} = boxes;
    images{i,1} = savemat_path(end-5:end);
end
clear boxes;
boxes = boxes_cell;
save(save_train_path, 'boxes', 'images');

%%
clear boxes boxes_cell images;
save_test_path = '../SelectiveSearchData/car_2015_test.mat';
fprintf('Performing testing selective search data: \n');
for i = num_train+1:images_num
    savemat_path = strcat(save_path, num2str(i,'%06d'));
    load(strcat(savemat_path, '_boxes'), 'boxes');
    boxes = boxes(:,[2,1,4,3])+1;
    boxes_cell{i-num_train} = boxes;
    images{i-num_train,1} = savemat_path(end-5:end);
end
clear boxes;
boxes = boxes_cell;
save(save_test_path, 'boxes', 'images');
fprintf('done! \n');
