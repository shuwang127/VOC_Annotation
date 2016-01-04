function source = init_source(input_path)
% Initializes video stream from an image sequence.
% Video stream

source.input_path = input_path;
source.files      = img_dir(input_path);
source.idx        = 1:length(source.files);