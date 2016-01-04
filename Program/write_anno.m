function [ xml_file ] = write_anno( BBox, FBO, i )
%
%
%

%% set the xml file path
img_file = FBO.source.files(FBO.source.idx(i)).name;
xml_file = strrep(img_file, FBO.input_path, FBO.anno_path);
xml_file = strrep(xml_file,'.jpg','.xml');

img = imread(img_file);
[height, width, depth] = size(img);

%% open the xml file and write ...
fp = fopen(xml_file, 'w');
fprintf(fp, '<annotation>\n');

    %<folder>CAR2015</folder>
    fprintf(fp, '\t<folder>CAR2015</folder>\n');
    %<filename>000001.jpg</filename>
    fprintf(fp, '\t<filename>%s</filename>\n', img_file(end-9:end));
    
    %<source>
    fprintf(fp, '\t<source>\n');
        fprintf(fp, '\t\t<database>The CAR2015 Database</database>\n');
        fprintf(fp, '\t\t<annotation>NUPT CAR2015</annotation>\n');
        fprintf(fp, '\t\t<image>xtnet</image>\n');
        fprintf(fp, '\t\t<xtnetid>%s</xtnetid>\n', img_file(end-9:end-4));
    fprintf(fp, '\t</source>\n');

    %<owner>
    fprintf(fp, '\t<owner>\n');
        fprintf(fp, '\t\t<name>Shu Wang</name>\n');
        fprintf(fp, '\t\t<nickname>Timely Rain</nickname>\n');
    fprintf(fp, '\t</owner>\n');
    
    %<size>
    fprintf(fp, '\t<size>\n');
        fprintf(fp, '\t\t<width>%d</width>\n', width);
        fprintf(fp, '\t\t<height>%d</height>\n', height);
        fprintf(fp, '\t\t<depth>%d</depth>\n', depth);
    fprintf(fp, '\t</size>\n');
    
    %<segmented>0</segmented>
    fprintf(fp, '\t<segmented>0</segmented>\n');
    
    %<object>
    for j = 1:size(BBox,1)
        fprintf(fp, '\t<object>\n');
            fprintf(fp, '\t\t<name>car</name>\n');
            fprintf(fp, '\t\t<color>Unspecified</color>\n');
            fprintf(fp, '\t\t<logo>Unspecified</logo>\n');
            fprintf(fp, '\t\t<pose>Unspecified</pose>\n');
            fprintf(fp, '\t\t<truncated>0</truncated>\n');
            fprintf(fp, '\t\t<difficult>0</difficult>\n');
            fprintf(fp, '\t\t<bndbox>\n');
                fprintf(fp, '\t\t\t<xmin>%d</xmin>\n', BBox(j,1));
                fprintf(fp, '\t\t\t<ymin>%d</ymin>\n', BBox(j,2));
                fprintf(fp, '\t\t\t<xmax>%d</xmax>\n', BBox(j,3));
                fprintf(fp, '\t\t\t<ymax>%d</ymax>\n', BBox(j,4));
            fprintf(fp, '\t\t</bndbox>\n');
        fprintf(fp, '\t</object>\n');
    end
    
% close the xml file and save ...
fprintf(fp, '</annotation>');
fclose(fp);
disp(['[Info] The ground-truth xml file has been saved as ', xml_file]);

end

