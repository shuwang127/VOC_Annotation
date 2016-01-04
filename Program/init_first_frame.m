function first_win = init_first_frame(source)

if  exist([source.input_path 'init.txt'],'file')
    bb = dlmread([source.input_path 'init.txt']);
    first_win = bb(:);
else
    img0 = frame_get( source, source.idx(1));
    first_win = win_click(img0.input);
end