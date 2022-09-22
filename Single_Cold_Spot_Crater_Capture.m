% Example image of a Cold Spot Crater
% August 27, 2019

close all
clear 
clc

%% RA MAP %%

% Coordinates and diameter of target crater

lon = -158.33;
lat = 11.596;
d = 0.653; % km

% Plot
figure();

n = 3;
f = 30; % km per degree at the equator

lowleft_corner_x = lon-(n*(d/2))/f;
lowleft_corner_y = lat-(n*(d/2))/f;
upright_corner_x = lon+(n*(d/2))/f;
upright_corner_y = lat+(n*(d/2))/f;

longitude_bounds = [lowleft_corner_x upright_corner_x];
latitude_bounds = [lowleft_corner_y upright_corner_y];

sceneRA = getscene_RA_SCM(longitude_bounds, latitude_bounds);

imagesc(longitude_bounds, latitude_bounds, sceneRA);
fontsize = 40;
c = colorbar;
x = get(c, 'Position');
x(3) = x(3) * 1.1;
set(c, 'Position', x);
caxis([0 0.1]);
ylabel(c,'Rock Abundance (fraction)','fontsize',fontsize);
set(gca,'YDir','normal','fontsize',fontsize,'linewidth', 2);
xlabel('Longitude', 'FontSize', fontsize);
ylabel('Latitude', 'FontSize', fontsize);

hold on

% Center
plot(lon, lat, '+', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', 'k', 'MarkerSize', 12, 'LineWidth', 2);

% Rim
r = rectangle('Position', [lon-(d/2)/f lat-(d/2)/f (lon+(d/2)/f)-(lon-(d/2)/f) (lat+(d/2)/f)-(lat-(d/2)/f)],...
    'Curvature', [1, 1],...
    'EdgeColor', 'k',...
    'LineWidth', 2);
r.LineStyle = '--';

% 500 m Scalebar
s = 0.5/f; % 0.0167 degrees
plot([upright_corner_x-3*s upright_corner_x-2*s], [lowleft_corner_y+s*2 lowleft_corner_y+s*2], '-w', 'LineWidth', 3);
text(upright_corner_x-2.5*s, lowleft_corner_y+1.7*s, '500 m', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Color', 'White', 'FontSize', 40);

axis square;

%% LROC MAP %%

figure();

filePath = 'LROC_NAC_mosaic.png';
b = imread(filePath);
image(b)
axis square;

set(gca,'YTickLabel',[]);
set(gca,'YTick',[]);
set(gca,'XTickLabel',[]);
set(gca,'XTick',[]);

hold on

% 500m Scalebar
plot([500 553.13], [600 600], '-w', 'LineWidth', 3);
text(525, 608, '500 m', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Color', 'White', 'FontSize', 30);

%% COMBINE IMAGES %%

a = imread('/Users/jaahnavee/Documents/RA Regolith Thickness/PSS_Submission/Figures/Fig2_1.jpg'); % [H x W] 1160 x 1586 % Load in Diviner map image
b = imread('/Users/jaahnavee/Documents/RA Regolith Thickness/PSS_Submission/Figures/Fig2_2.jpg'); % [H x W] 744 × 1140 % Load in LROC mosaic

size_a = size(a);
size_b = size(b);

% get the new sizes - this approach requires even image size
newSizeA = [size_a(1), size_a(2)];
newSizeB = [size_a(1), size_a(1)*(size_b(2)/size_b(1))];
    
% resize the images and stick together
collImg = [imresize(a, newSizeA) imresize(b, newSizeB)];

% display the image
figure, imshow(collImg)
set(gca, 'FontSize', 30);

% Annotation
a = annotation('textbox', [0.07, 0.93, 0, 0], 'string', '(a)');
a.FontSize = 30;
a.Color = 'k';

b = annotation('textbox', [0.52, 0.93, 0, 0], 'string', '(b)');
b.FontSize = 30;
b.Color = 'k';
