function [ ] = save_seg( BBox, FBO, i )
%SAVE_SEG Summary of this function goes here
%   Detailed explanation goes here

%%
img_file = FBO.source.files(FBO.source.idx(i)).name;
seg_file = strrep(img_file, FBO.input_path, FBO.seg_path);
seg_file = strrep(seg_file, '.jpg', '_00.jpg');
img = imread(img_file);

for j = 1:size(BBox,1)
    imgseg = img(BBox(j,2):BBox(j,4),BBox(j,1):BBox(j,3),:);
    seg_file(end-5:end-4) = num2str(j,'%02d');
    imwrite(imgseg, seg_file);
end

disp(['[Info] The segmentation images have been saved as ', seg_file(1:end-6) , '**.jpg']);

end

