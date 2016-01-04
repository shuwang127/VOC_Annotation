function MOD = Display(varargin)   
if varargin{2}==1
    MOD = varargin{1};
    if ~isfield(MOD,'handle')
        MOD.handle = imshow(MOD.frame.input,'initialmagnification','fit');
        set(gcf,'MenuBar','none','ToolBar','none','color',[0 0 0]);
        set(gca,'position',[0 0 1 1]);      
        set(MOD.handle,'cdata',MOD.frame.input);
        hold on; 
        
        i = MOD.source.idx(1);
        text(20,20,num2str(i),'FontSize',24,'Color','r');
        bb_draw(MOD.BB, 'edgecolor',MOD.edgecolor, 'LineWidth',MOD.LineWidth);
        set(gcf,'Position',[300 300 MOD.FrameW MOD.FrameH]);
    end        
        i = MOD.source.idx(varargin{2});
        if MOD.save==1
        img = getframe(1);
        imwrite(img.cdata,[MOD.output_path  num2str(i,'%05d') '.jpg']);
        end
else
    MOD = varargin{1};
    i = MOD.source.idx(varargin{2});
    
    h = get(gca,'Children'); delete(h(1:end-1));
    set(MOD.handle,'cdata',MOD.frame.input); hold on;

    text(20,20,num2str(i),'FontSize',24,'Color','r');
    bb_draw(MOD.BB, 'edgecolor',MOD.edgecolor, 'LineWidth',MOD.LineWidth,'curvature',[0 0]);

    drawnow;
%% Save
    if MOD.save == 1
        img = getframe(1);
        imwrite(img.cdata,[MOD.output_path  num2str(i,'%05d') '.jpg']);
    end
end

hold off;
    
return