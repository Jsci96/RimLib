function sceneRA = showregRA(lonBounds,latBounds)

    fontsize = 35;

    % CONVERT LAT/LON COORDINATES TO PIXEL INDICIES
    xBounds = lonBounds*128 + 23039.5; % Bounds in pixels (for 128 pix/deg === 240 m/pix at the equator). Sample_projection_offset = 23039.5
    yBounds = latBounds*(-128) + 10239.5-(128*10); % Line_projection_offset = 10239.5
    
    % READ JP2 FILE
    sceneRA = 0.001*double(imread('RA_SCM_-70to70N.jp2','PixelRegion',{[floor(yBounds(2)) ceil(yBounds(1))],[floor(xBounds(1)) ceil(xBounds(2))]}));
    sceneRA(sceneRA <= -3.26e4*.001) = NaN;
    
    % CREATE PLOT
    imagesc(lonBounds,[latBounds(2) latBounds(1)], sceneRA)
    c = colorbar;
    x = get(c, 'Position');
    x(3) = x(3) * 1.1;
    set(c, 'Position', x);
    caxis([0 .1])
    ylabel(c,'Rock Abundance (fraction)','fontsize',fontsize)
    set(gca,'YDir','normal','fontsize',fontsize,'linewidth',1)
    xlabel('Longitude', 'FontSize', fontsize)
    ylabel('Latitude', 'FontSize', fontsize)
        
end