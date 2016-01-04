function [ save_file ] = save_output( BBox, FBO, i )
%
%
%

%%
img_file = FBO.source.files(FBO.source.idx(i)).name;
edgecolor = [255,0,0]; % red

img = imread(img_file);
for j = 1:size(BBox,1)
    for k = 1:3
        img(BBox(j,2):BBox(j,4),BBox(j,1)+(0:1),k) = edgecolor(k);
        img(BBox(j,2):BBox(j,4),BBox(j,3)+(0:1),k) = edgecolor(k);
        img(BBox(j,2)+(0:1),BBox(j,1):BBox(j,3),k) = edgecolor(k);
        img(BBox(j,4)+(0:1),BBox(j,1):BBox(j,3),k) = edgecolor(k);
    end
    
    for m = 1:j
        for k = 1:3
            img(BBox(j,2)+5*m+(0:2),BBox(j,1)+5+(0:2),k) = edgecolor(k);
        end
    end
end

save_file = strrep(img_file, FBO.input_path, FBO.output_path);
imwrite(img, save_file);
disp(['[Info] The ground-truth image has been saved as ', save_file]);

end

