function [ BBox ] = get_bbox( source, i )
%   X Summary of this function goes here
%   Detailed explanation goes here

%% get the num of cars in the picture
img = frame_get( source, source.idx(i));
imshow(uint8(img.input));

num = input(['Number of Cars in ', source.files(source.idx(i)).name, ' : ']);
disp(['Please draw ',num2str(num),' box(es) in this picture..']);

%% get the bounding boxes coordinates
BBox = [];
for j = 1:num
    bb = win_click(img.input);
    BBox = [BBox; round(bb')];
    fprintf(1+(j==num), '*%d* ',j);
end
fprintf('\n');
disp(['[Info] The BBox has been saved ', num2str(size(BBox,1)), ' * ', num2str(size(BBox,2))]);

end