% Plots for manuscript: Statistical Estimated of Rock-Free Lunar Regolith
% Thickness from Diviner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by: Jaahnavee Venkatraman
% Start file: 08/01/2018
% End file: 01/16/2019

clc
clear
close all

%% READ IN FILES %%

ra_data = csvread("/Users/Jaahnavee/Documents/RA Regolith Thickness/Final Code and Data/New_Maps_New_CS_NRA.csv"); % read RA data pulled using Crater_nRadii_RAMatrix_Capture.m

% Change -ves to 0s

ra_data(ra_data(:, 9) < 10^-15, 9) = 0; % data impute

% Colors

lightGrey2   = [0.7 0.7 0.7];
darkGrey2  = [0.2 0.2 0.2];

%% PLOT DIAMETER DISTRIBUTION %%

figure();

h = histogram(ra_data(:,4),...
        'FaceColor', darkGrey2, 'EdgeColor', 'White');
h.BinWidth = 0.125;
grid on;
xlabel('Diameter [km]', 'fontsize', 18);
ylabel('Frequency', 'fontsize', 18);
set(gca, 'fontsize', 15);
set(gca, 'yscale', 'log');

patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'r');

axes('Position', [0.4 0.4 0.4 0.4]);
histogram(ra_data(:,4), 20,...
    'FaceColor', darkGrey2, 'EdgeColor', 'White');
grid on;
xlim([0.5 2.5]);
ylim([0 40]);

patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'r');

annotation('arrow', 'Position', [0.6 0.14 0 0.2]);

set(gca, 'yscale', 'log');

[num2str(sum(ra_data(:,3) <= 500)*100/length(ra_data(:,3))) '% craters have a diameter <= 500 m']

%% PLOT DIAMETER DISTRIBUTION: MARE VS. HIGHLANDS %%

figure();

lon = ra_data(:, 1);
lat = ra_data(:, 2);
 
high = find(ra_data(:, 5) == 1);
mare = find(ra_data(:, 5) == 0);

subplot(1, 2, 1);

h1 = histogram(ra_data(high,4),...
        'FaceColor', 'Blue', 'EdgeColor', 'k', 'FaceAlpha', 1);

hold on;

h1.BinWidth = 0.1;
grid on;
xlabel('Diameter [km]', 'fontsize', 18);
ylabel('Crater count', 'fontsize', 18);
xlim([-0.1 2.5]);
ylim([0 720]);
t = text(2.1, 750, ['n = ' num2str(length(high))]);
t.FontSize = 20;

set(gca, 'FontSize', 20);

patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.2, 'EdgeColor', 'r');

axes('Position', [0.22 0.5 0.2 0.2]);
h11 = histogram(ra_data(high,4), 20,...
    'FaceColor', 'Blue', 'EdgeColor', 'k');
h11.BinWidth = 0.1;
grid on;
xlim([0.5 2.5]);
ylim([0 21]);
 
patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.2, 'EdgeColor', 'k');
annotation('arrow', 'Position', [0.34 0.165 0 0.335]);

set(gca, 'FontSize', 17);

subplot(1, 2, 2);

h2 = histogram(ra_data(mare,4),...
        'FaceColor', [0.4660, 0.6740, 0.1880], 'EdgeColor', 'k', 'FaceAlpha', 1);
hold on;

h2.BinWidth = 0.1;
grid on;
xlabel('Diameter [km]', 'fontsize', 18);
ylabel('Crater count', 'fontsize', 18);
xlim([-0.1 2.5]);
ylim([0 720]);
t = text(2.1, 750, ['n = ' num2str(length(mare))]);
t.FontSize = 20;

set(gca, 'FontSize', 20);
 
patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.2, 'EdgeColor', 'r');
  
axes('Position', [0.66 0.5 0.2 0.2]);
h22 = histogram(ra_data(mare,4), 20,...
    'FaceColor', [0.4660, 0.6740, 0.1880], 'EdgeColor', 'k');
h22.BinWidth = 0.1;
grid on;
xlim([0.5 2.5]);
ylim([0 21]);

patch([0.5 2.5 2.5 0.5], [0 0 40 40], 'k', 'FaceAlpha', 0.2, 'EdgeColor', 'k');
annotation('arrow', 'Position', [0.78 0.165 0 0.335]);

set(gca, 'FontSize', 17);

 
%% PLOT RA: HIGHLANDS VS. MARE (REFER TO JUPYTER NOTEBOOK FOR THIS PLOT) %%

% Highlands vs. Mare Subplots

% figure();
% 
% lon = ra_data(:, 1);
% lat = ra_data(:, 2);
% 
% high = find(ra_data(:, 5) == 1);
% mare = find(ra_data(:, 5) == 0);
% 
% set(gcf, 'Position', [300 200 800 500]);
%     
%     loglog(ra_data(high, 4), ra_data(high, 9), 'o',...
%         'MarkerSize', 8,...
%         'MarkerFaceColor', [0.75 0.75 0.75],...
%         'MarkerEdgeColor', 'Black');
%     
%     hold on
%     
%     loglog(ra_data(mare, 4), ra_data(mare, 9), 'o',...
%         'MarkerSize', 8,...
%         'MarkerEdgeColor', 'Black',...
%         'MarkerFaceColor', 'Black');
%     
%     hold on
%     
%     loglog(mean(ra_data(high, 4)), mean(ra_data(high, 9)), 's',...
%         'MarkerSize', 15,...
%         'MarkerEdgeColor', 'White',...
%         'MarkerFaceColor', 'Blue')
%     
%     hold on
%    
%     loglog(mean(ra_data(mare, 4)), mean(ra_data(mare, 9)), 's',...
%         'MarkerSize', 15,...
%         'MarkerEdgeColor', 'White',...
%         'MarkerFaceColor', 'Green')
%     
%     hold on
%     
%     hockey_thresh = 0.1;
%     line([10^-2 10], [hockey_thresh hockey_thresh],...
%         'Color', 'Black');
%     annotation('textbox', [0.2 0.05 0.3 hockey_thresh+0.67], 'String',...
%     ['\fontsize{18} \color{Black} NRA = ' num2str(hockey_thresh*100) '%'],...
%     'FontWeight', 'bold',...
%     'EdgeColor', 'None',...
%     'FaceAlpha', 0.8);
% 
%     xlabel('Crater Diameter [km]', 'FontSize', 20);
%     y = ylabel({'Normalized Diviner Rock Abundance'; '(NRA)'}, 'FontSize', 20);
%     set(y, 'Position', get(y, 'Position')-[0.002 0 0]);
%     title('Rock Abundance: Highlands vs. Mare', 'FontSize', 22);
%     grid on
%     box = legend('Highlands', 'Mare', 'Highlands Centroid', 'Mare Centroid', 'Location', 'SouthEast');
%     box.FontSize = 23;
%     
%  ax = gca;
%  ax.GridAlpha = 0.3;
%  set(gca, 'FontSize', 15);

% a = imread('/Users/jaahnavee/Desktop/Figure5_1.jpg'); % [H x W] 576 x 864
% b = imread('/Users/jaahnavee/Desktop/Figure5_2.jpg'); % [H x W] 576 × 864
%   
% % resize the images and stick together
% q = 1400;
% collImg = [imresize(a, [q q*1.5]); imresize(b, [q q*1.5])];
% 
% % display the image
% figure, imshow(collImg)
% 
% set(gca, 'FontSize', 30);
% 
% % Annotation
% a = annotation('textbox', [0.31, 0.97, 0, 0], 'string', '(a)');
% a.FontSize = 30;
% a.Color = 'k';
% 
% b = annotation('textbox', [0.31, 0.53, 0, 0], 'string', '(b)');
% b.FontSize = 30;
% b.Color = 'k';

%% HIST: NRA FOR DIAMETERS 0-100m | 100-200m | 200-500m | 500-1km %%

% We have binned the data disretely to be able to calculate a probability
% plot. Since values are discretized and self-defined, the sum of all
% values in the plot adds to 1 and the plot itself can be characterized as
% a probability plot rather than a density plot.

lon = ra_data(:, 1);
lat = ra_data(:, 2);
 
high = find(ra_data(:, 5) == 1);
mare = find(ra_data(:, 5) == 0);

bin_width = 0.0005; % 0.0005 km (0.5 m) bin size 
RA_bins = 0:bin_width:0.08;

thresh = 0.8/100; % Threshold
z = 1.96; % For CI error bars
green = [0.3 0.77 0.15]; % Color for Mare

% Diameter Groups in km
a = 0.1;
b = 0.2;
c = 0.5; 
d = 1; 
e = 2.4;

one = ra_data(find(ra_data(:, 4) < a), 9);
two = ra_data(find(ra_data(:, 4) >= a & ra_data(:, 4) < b), 9);
three = ra_data(find(ra_data(:, 4) >= b & ra_data(:, 4) < c), 9);
four = ra_data(find(ra_data(:, 4) >= c & ra_data(:, 4) < d), 9);
five = ra_data(find(ra_data(:, 4) >= d & ra_data(:, 4) <= e), 9);

one_h = ra_data(find(ra_data(high, 4) < a), 9);
two_h = ra_data(find(ra_data(high, 4) >= a & ra_data(high, 4) < b), 9);
three_h = ra_data(find(ra_data(high, 4) >= b & ra_data(high, 4) < c), 9);
four_h = ra_data(find(ra_data(high, 4) >= c & ra_data(high, 4) <= d), 9);
five_h = ra_data(find(ra_data(high, 4) >= d & ra_data(high, 4) <= e), 9);

one_m = ra_data(find(ra_data(mare, 4) < a), 9);
two_m = ra_data(find(ra_data(mare, 4) >= a & ra_data(mare, 4) < b), 9);
three_m = ra_data(find(ra_data(mare, 4) >= b & ra_data(mare, 4) < c), 9);
four_m = ra_data(find(ra_data(mare, 4) >= c & ra_data(mare, 4) <= d), 9);
five_m = ra_data(find(ra_data(mare, 4) >= d & ra_data(mare, 4) <= e), 9);

figure();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 1)

% Probability Plot

h = histcounts(one_h, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(1) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-b', 'MarkerSize', 7, 'MarkerFaceColor', 'b', 'CapSize', 7);
p(1).LineWidth = 1.5;

hold on

h = histcounts(one_m, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(2) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-g', 'MarkerSize', 7, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'CapSize', 7);
p(2).LineWidth = 1.5;

%hold on
%plot(RA_bins(1:end-1), cumsum(h)/sum(h), '-k');

xlabel('NRA', 'FontSize', 22);
ylabel('Probability', 'FontSize', 22);
title('0 - 100 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0 0.03]);
ylim([0 0.3]);

% Threshold Line

plot([thresh thresh], [0 1], '--k');
text(thresh+0.0008, 0.15, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);

% Highlight Patch

patch([0 thresh thresh 0], [0 0 1 1], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% (a) Annotations

a = annotation('textbox', [0.1, 0.99, 0, 0], 'string', '(a)');
a.FontSize = 20;

% Legend

box = legend([p(1) p(2)], ['Highlands \itn = ' num2str(length(one_h))], ['Mare \itn = ' num2str(length(one_m))],...
    'Location', 'NorthEast');
box.FontSize = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 2)

% Probability Plot

h = histcounts(two_h, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(1) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-b', 'MarkerSize', 7, 'MarkerFaceColor', 'b', 'CapSize', 7);
p(1).LineWidth = 1.5;

hold on

h = histcounts(two_m, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(2) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-g', 'MarkerSize', 7, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'CapSize', 7);
p(2).LineWidth = 1.5;

xlabel('NRA', 'FontSize', 22);
ylabel('Probability', 'FontSize', 22);
title('100 - 200 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0 0.03]);
ylim([0 0.3]);

% Threshold Line

plot([thresh thresh], [0 1], '--k');
text(thresh+0.0008, 0.15, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);

% Highlight Patch

patch([0 thresh thresh 0], [0 0 1 1], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% (b) Annotation

a = annotation('textbox', [0.54, 0.99, 0, 0], 'string', '(b)');
a.FontSize = 20;

% Legend

box = legend([p(1) p(2)], ['Highlands \itn = ' num2str(length(two_h))], ['Mare \itn = ' num2str(length(two_m))],...
    'Location', 'NorthEast');
box.FontSize = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 3)

% Probability Plot

h = histcounts(three_h, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(1) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-b', 'MarkerSize', 7, 'MarkerFaceColor', 'b', 'CapSize', 7);
p(1).LineWidth = 1.5;

hold on

h = histcounts(three_m, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(2) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-g', 'MarkerSize', 7, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'CapSize', 7);
p(2).LineWidth = 1.5;

xlabel('NRA', 'FontSize', 22);
ylabel('Probability', 'FontSize', 22);
title('200 - 500 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0 0.03]);
ylim([0 0.3]);

% Threshold Line

plot([thresh thresh], [0 1], '--k');
text(thresh+0.0008, 0.15, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);

% Highlight Patch

patch([0 thresh thresh 0], [0 0 1 1], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% (c) Annotation

a = annotation('textbox', [0.1, 0.51, 0, 0], 'string', '(c)');
a.FontSize = 20;

% Legend

box = legend([p(1) p(2)], ['Highlands \itn = ' num2str(length(three_h))], ['Mare \itn = ' num2str(length(three_m))],...
    'Location', 'NorthEast');
box.FontSize = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 4)

% Probability Plot

h = histcounts(four_h, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(1) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-b', 'MarkerSize', 7, 'MarkerFaceColor', 'b', 'CapSize', 7);
p(1).LineWidth = 1.5;

hold on

h = histcounts(four_m, RA_bins);

n = length(h/sum(h));
s = std(h/sum(h));
CI_high = h/sum(h) + z*(s/sqrt(n));
CI_low = h/sum(h) - z*(s/sqrt(n));

p(2) = errorbar(RA_bins(1:end-1), h/sum(h), CI_low, CI_high, 'o-g', 'MarkerSize', 7, 'MarkerFaceColor', green, 'MarkerEdgeColor', green, 'CapSize', 7);
p(2).LineWidth = 1.5;

xlabel('NRA', 'FontSize', 22);
ylabel('Probability', 'FontSize', 22);
title('500 m - 1 km', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0 0.03]);
ylim([0 0.3]);

% Threshold Line

plot([thresh thresh], [0 1], '--k');
text(thresh+0.0008, 0.15, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);

% Highlight Patch

patch([0 thresh thresh 0], [0 0 1 1], 'k', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% (d) Annotation

a = annotation('textbox', [0.54, 0.51, 0, 0], 'string', '(d)');
a.FontSize = 20;

% Legend

box = legend([p(1) p(2)], ['Highlands \itn = ' num2str(length(four_h))], ['Mare \itn = ' num2str(length(four_m))],...
    'Location', 'NorthEast');
box.FontSize = 20;

%% FOR SUPPLEMENTARY SECTION (1) %%

lon = ra_data(:, 1);
lat = ra_data(:, 2);
 
high = find(ra_data(:, 5) == 1);
mare = find(ra_data(:, 5) == 0);

bin_width = 0.0005; % 0.0005 km (0.5 m) bin size 
RA_bins = 0:bin_width:0.08;

thresh = 0.8/100; % Threshold
prob = 5/100; % 5% probability

% Diameter Groups in km
a = 0.1;
b = 0.2;
c = 0.5; 
d = 1; 
e = 2.4;

one = ra_data(find(ra_data(:, 4) < a), 9);
two = ra_data(find(ra_data(:, 4) >= a & ra_data(:, 4) < b), 9);
three = ra_data(find(ra_data(:, 4) >= b & ra_data(:, 4) < c), 9);
four = ra_data(find(ra_data(:, 4) >= c & ra_data(:, 4) < d), 9);
five = ra_data(find(ra_data(:, 4) >= d & ra_data(:, 4) <= e), 9);

one_h = ra_data(find(ra_data(high, 4) < a), 9);
two_h = ra_data(find(ra_data(high, 4) >= a & ra_data(high, 4) < b), 9);
three_h = ra_data(find(ra_data(high, 4) >= b & ra_data(high, 4) < c), 9);
four_h = ra_data(find(ra_data(high, 4) >= c & ra_data(high, 4) <= d), 9);
five_h = ra_data(find(ra_data(high, 4) >= d & ra_data(high, 4) <= e), 9);

one_m = ra_data(find(ra_data(mare, 4) < a), 9);
two_m = ra_data(find(ra_data(mare, 4) >= a & ra_data(mare, 4) < b), 9);
three_m = ra_data(find(ra_data(mare, 4) >= b & ra_data(mare, 4) < c), 9);
four_m = ra_data(find(ra_data(mare, 4) >= c & ra_data(mare, 4) <= d), 9);
five_m = ra_data(find(ra_data(mare, 4) >= d & ra_data(mare, 4) <= e), 9);

figure();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 1)

% Log Probability Plot

h = histcounts(one_h, RA_bins);
p(1) = plot(RA_bins(1:end-1), log(h/sum(h)), 'ob', 'MarkerSize', 9, 'MarkerFaceColor', 'b');

hold on

h = histcounts(one_m, RA_bins);
p(2) = plot(RA_bins(1:end-1), log(h/sum(h)), 'og', 'MarkerSize', 9, 'MarkerFaceColor', 'g');

xlabel('NRA', 'FontSize', 22);
ylabel('Log Probability', 'FontSize', 22);
title('0 - 100 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0-0.001 0.08]);
ylim([-7 -1]);

% Threshold Lines

plot([thresh thresh], [-7 -1], '--r');
text(thresh+0.0015, -2.8, [num2str(thresh*100) ' % NRA'], 'Rotation', 90, 'FontSize', 22);

% (a) Annotation

b = annotation('textbox', [0.1, 0.99, 0, 0], 'string', '(a)');
b.FontSize = 20;

% Highlight Patch 1

patch([0-0.001 thresh thresh 0-0.001], [-7 -7 -1 -1], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Inset plot

axes('Position', [0.31 0.73 0.14 0.14]);
h = histcounts(one_h, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerSize', 9, 'MarkerFaceColor', 'b');
hold on
h = histcounts(one_m, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerSize', 9, 'MarkerFaceColor', 'g');
grid on;
set(gca, 'FontSize', 15);
xlim([0 0.03]);
ylim([0 0.3]);
xlabel('NRA');
ylabel('Probability');

plot([thresh thresh], [0 0.3], '--r');
text(thresh+0.0004, 0.06, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);
set(gca, 'FontSize', 20);

% Highlight Patch 2

patch([0 thresh thresh 0], [0 0 0.3 0.3], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Legend

box = legend([p(1) p(2)], 'Highlands', 'Mare',...
    'Location', 'NorthEast');
box.FontSize = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 2)

% Log Probability Plot

h = histcounts(two_h, RA_bins);
p(1) = plot(RA_bins(1:end-1), log(h/sum(h)), 'ob', 'MarkerSize', 9, 'MarkerFaceColor', 'b');

hold on

h = histcounts(two_m, RA_bins);
p(2) = plot(RA_bins(1:end-1), log(h/sum(h)), 'og', 'MarkerSize', 9, 'MarkerFaceColor', 'g');

xlabel('NRA', 'FontSize', 22);
ylabel('Log Probability', 'FontSize', 22);
title('100 - 200 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0-0.001 0.08]);
ylim([-7 -1]);

% Threshold Lines

plot([thresh thresh], [-7 -1], '--r');
text(thresh+0.0015, -2.8, [num2str(thresh*100) ' % NRA'], 'Rotation', 90, 'FontSize', 22);

% (b) Annotation

b = annotation('textbox', [0.54, 0.99, 0, 0], 'string', '(b)');
b.FontSize = 20;

% Highlight Patch 1

patch([0-0.001 thresh thresh 0-0.001], [-7 -7 -1 -1], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Inset plot

axes('Position', [0.75 0.73 0.14 0.14]);
h = histcounts(one_h, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerSize', 9, 'MarkerFaceColor', 'b');
hold on
h = histcounts(one_m, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerSize', 9, 'MarkerFaceColor', 'g');
grid on;
set(gca, 'FontSize', 15);
xlim([0 0.03]);
ylim([0 0.3]);
xlabel('NRA');
ylabel('Probability');

plot([thresh thresh], [0 0.3], '--r');
text(thresh+0.0004, 0.06, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);
set(gca, 'FontSize', 20);

% Highlight Patch 2

patch([0 thresh thresh 0], [0 0 0.3 0.3], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Legend

box = legend([p(1) p(2)], 'Highlands', 'Mare',...
    'Location', 'NorthEast');
box.FontSize = 20;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 3)

% Log Probability Plot

h = histcounts(three_h, RA_bins);
p(1) = plot(RA_bins(1:end-1), log(h/sum(h)), 'ob', 'MarkerSize', 9, 'MarkerFaceColor', 'b');

hold on

h = histcounts(three_m, RA_bins);
p(2) = plot(RA_bins(1:end-1), log(h/sum(h)), 'og', 'MarkerSize', 9, 'MarkerFaceColor', 'g');

xlabel('NRA', 'FontSize', 22);
ylabel('Log Probability', 'FontSize', 22);
title('200 - 500 m', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0-0.001 0.08]);
ylim([-7 -1]);

% Threshold Lines

plot([thresh thresh], [-7 -1], '--r');
text(thresh+0.0015, -2.8, [num2str(thresh*100) ' % NRA'], 'Rotation', 90, 'FontSize', 22);

% (c) Annotation

b = annotation('textbox', [0.1, 0.51, 0, 0], 'string', '(c)');
b.FontSize = 20;

% Highlight Patch 1

patch([0-0.001 thresh thresh 0-0.001], [-7 -7 -1 -1], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Inset plot

axes('Position', [0.25 0.3 0.14 0.14]);
h = histcounts(three_h, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerSize', 9, 'MarkerFaceColor', 'b');
hold on
h = histcounts(three_m, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerSize', 9, 'MarkerFaceColor', 'g');
grid on;
set(gca, 'FontSize', 15);
xlim([0 0.03]);
ylim([0 0.3]);
xlabel('NRA');
ylabel('Probability');

plot([thresh thresh], [0 0.3], '--r');
text(thresh+0.0004, 0.06, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);
set(gca, 'FontSize', 20);

% Highlight Patch 2

patch([0 thresh thresh 0], [0 0 0.3 0.3], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Legend

box = legend([p(1) p(2)], 'Highlands', 'Mare',...
    'Location', 'NorthEast');
box.FontSize = 20;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2, 2, 4)

% Log Probability Plot

h = histcounts(four_h, RA_bins);
p(1) = plot(RA_bins(1:end-1), log(h/sum(h)), 'ob', 'MarkerSize', 9, 'MarkerFaceColor', 'b');

hold on

h = histcounts(four_m, RA_bins);
p(2) = plot(RA_bins(1:end-1), log(h/sum(h)), 'og', 'MarkerSize', 9, 'MarkerFaceColor', 'g');

xlabel('NRA', 'FontSize', 22);
ylabel('Log Probability', 'FontSize', 22);
title('500 m - 1 km', 'FontSize', 22);
set(gca, 'FontSize', 22);
grid on
xlim([0-0.001 0.08]);
ylim([-7 -1]);

% Threshold Lines

plot([thresh thresh], [-7 -1], '--r');
text(thresh+0.0015, -5.8, [num2str(thresh*100) ' % NRA'], 'Rotation', 90, 'FontSize', 22);

% (d) Annotation

b = annotation('textbox', [0.54, 0.51, 0, 0], 'string', '(d)');
b.FontSize = 20;

% Highlight Patch 1

patch([0-0.001 thresh thresh 0-0.001], [-7 -7 -1 -1], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Inset plot

axes('Position', [0.73 0.17 0.14 0.14]);
h = histcounts(four_h, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerSize', 9, 'MarkerFaceColor', 'b');
hold on
h = histcounts(four_m, RA_bins);
plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerSize', 9, 'MarkerFaceColor', 'g');
grid on;
set(gca, 'FontSize', 15);
xlim([0 0.03]);
ylim([0 0.3]);
xlabel('NRA');
ylabel('Probability');

plot([thresh thresh], [0 0.3], '--r');
text(thresh+0.0004, 0.06, [num2str(thresh*100) '% NRA'], 'Rotation', 90, 'FontSize', 20);
set(gca, 'FontSize', 20);

% Highlight Patch 2

patch([0 thresh thresh 0], [0 0 0.3 0.3], 'r', 'FaceAlpha', 0.1, 'EdgeColor', 'None');

% Legend

box = legend([p(1) p(2)], 'Highlands', 'Mare',...
    'Location', 'NorthEast');
box.FontSize = 20;

%% FOR SUPPLEMENTARY SECTION (2) %%

% lon = ra_data(:, 1);
% lat = ra_data(:, 2);
%  
% high = find(ra_data(:, 5) == 1);
% mare = find(ra_data(:, 5) == 0);
% 
% bin_width = 0.0005; % 0.0005 (0.05%) NRA bin size 
% RA_bins = 0:bin_width:0.08;
% 
% thresh = 0.8/100; % Threshold
% green = [0.3 0.77 0.15]; % Color for Mare
% red = [0.5430 0 0]; % Color for red panels
% 
% % Diameter Groups in km
% a = 0.1;
% b = 0.2;
% c = 0.5; 
% d = 1; 
% e = 2.4;
% 
% one = ra_data(find(ra_data(:, 4) < a), 9);
% two = ra_data(find(ra_data(:, 4) >= a & ra_data(:, 4) < b), 9);
% three = ra_data(find(ra_data(:, 4) >= b & ra_data(:, 4) < c), 9);
% four = ra_data(find(ra_data(:, 4) >= c & ra_data(:, 4) < d), 9);
% five = ra_data(find(ra_data(:, 4) >= d & ra_data(:, 4) <= e), 9);
% 
% one_h = ra_data(find(ra_data(high, 4) < a), 9);
% two_h = ra_data(find(ra_data(high, 4) >= a & ra_data(high, 4) < b), 9);
% three_h = ra_data(find(ra_data(high, 4) >= b & ra_data(high, 4) < c), 9);
% four_h = ra_data(find(ra_data(high, 4) >= c & ra_data(high, 4) <= d), 9);
% five_h = ra_data(find(ra_data(high, 4) >= d & ra_data(high, 4) <= e), 9);
% 
% one_m = ra_data(find(ra_data(mare, 4) < a), 9);
% two_m = ra_data(find(ra_data(mare, 4) >= a & ra_data(mare, 4) < b), 9);
% three_m = ra_data(find(ra_data(mare, 4) >= b & ra_data(mare, 4) < c), 9);
% four_m = ra_data(find(ra_data(mare, 4) >= c & ra_data(mare, 4) <= d), 9);
% five_m = ra_data(find(ra_data(mare, 4) >= d & ra_data(mare, 4) <= e), 9);
% 
% figure();
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% subplot(2, 2, 1)
% 
% h = histcounts(one_h, RA_bins);
% p(1) = plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% 
% hold on
% 
% h = histcounts(one_m, RA_bins);
% p(2) = plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', green, 'MarkerSize', 7);
% 
% hold on
% 
% cum_prob = [];
% h = histcounts(one, RA_bins);
% prob = h/sum(h);
% cum_prob(1) = 0;
% cum_prob(2) = prob(1);
% for i = 3:size(RA_bins(1:end-1), 2)
%     cum_prob(i) = prob(i-1) + cum_prob(i-1);
% end
% 
% p(3) = plot(RA_bins(1:end-1), cum_prob, '-k', 'LineWidth', 1.5); % Cumul. dist.
% 
% ax = gca;
% ax.YTick = [0 0.2 0.4 0.6 0.8 1];
% 
% xlabel('NRA', 'FontSize', 22);
% ylabel('Probability', 'FontSize', 22);
% ylim([0 1]);
% title('0 - 100 m', 'FontSize', 22);
% set(gca, 'FontSize', 22);
% grid on
% 
% % Threshold Line
% 
% script = text(thresh+0.003, 0.5, [num2str(thresh*100) ' % NRA']);
% script.FontSize = 18;
% set(script, 'Rotation', 90);
% 
% % (a)
% 
% c = annotation('textbox', [0.1, 0.99, 0, 0], 'string', '(a)');
% c.FontSize = 20;
% 
% % Highlight Patch 1
% 
% patch([0 thresh thresh 0], [0 0 1 1], red, 'FaceAlpha', 0.15, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Inset Plot
% 
% axes('Position', [0.22 0.68 0.14 0.14]);
% h = histcounts(one_h, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% hold on
% h = histcounts(one_m, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', green, 'MarkerSize', 7);
% grid on;
% set(gca, 'FontSize', 15);
% xlim([0 0.03]);
% ylim([0 0.2]);
% 
% % Highlight Patch 2
% 
% patch([0 thresh thresh 0], [0 0 0.3 0.3], red, 'FaceAlpha', 0.15, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Legend
% 
% box = legend([p(1) p(2) p(3)], 'Highlands', 'Mare', 'CDF',...
%     'Location', 'NorthEast');
% box.FontSize = 20;
% set(box, 'Position', [0.365 0.815 0.1 0.1]);
% 
% % Arrow
% 
% annotation('textarrow', [0.163 0.22], [0.71 0.71], 'Linewidth', 1.5, 'Color', 'Red');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% subplot(2, 2, 2)
% 
% h = histcounts(two_h, RA_bins);
% p(1) = plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% 
% hold on
% 
% h = histcounts(two_m, RA_bins);
% p(2) = plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', green, 'MarkerSize', 7);
% 
% hold on
% 
% cum_prob = [];
% h = histcounts(two, RA_bins);
% prob = h/sum(h);
% cum_prob(1) = 0;
% cum_prob(2) = prob(1);
% for i = 3:size(RA_bins(1:end-1), 2)
%     cum_prob(i) = prob(i-1) + cum_prob(i-1);
% end
% 
% p(3) = plot(RA_bins(1:end-1), cum_prob, '-k', 'LineWidth', 1.5); % Cumul. dist.
% 
% ax = gca;
% ax.YTick = [0 0.2 0.4 0.6 0.8 1];
% 
% xlabel('NRA', 'FontSize', 22);
% ylabel('Probability', 'FontSize', 22);
% ylim([0 1]);
% title('100 - 200 m', 'FontSize', 22);
% set(gca, 'FontSize', 22);
% grid on
% 
% % Threshold Line
% 
% script = text(thresh+0.003, 0.12, [num2str(thresh*100) ' % NRA']);
% script.FontSize = 18;
% set(script, 'Rotation', 90);
% 
% % (b)
% 
% c = annotation('textbox', [0.54, 0.99, 0, 0], 'string', '(b)');
% c.FontSize = 20;
% 
% % Highlight Patch 1
% 
% patch([0 thresh thresh 0], [0 0 1 1], red, 'FaceAlpha', 0.15, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Inset Plot
% 
% axes('Position', [0.69 0.66 0.14 0.14]);
% h = histcounts(two_h, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% hold on
% h = histcounts(two_m, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', green, 'MarkerSize', 7);
% grid on;
% set(gca, 'FontSize', 15);
% xlim([0 0.03]);
% ylim([0 0.2]);
% 
% % Highlight Patch 2
% 
% patch([0 thresh thresh 0], [0 0 0.3 0.3], red, 'FaceAlpha', 0.15, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Legend
% 
% box = legend([p(1) p(2) p(3)], 'Highlands', 'Mare', 'CDF',...
%     'Location', 'NorthEast');
% box.FontSize = 20;
% set(box, 'Position', [0.805 0.815 0.1 0.1]);
% 
% % Arrow
% 
% annotation('textarrow', [0.605 0.69], [0.78 0.78], 'Linewidth', 1.5, 'Color', 'Red');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% subplot(2, 2, 3)
% 
% h = histcounts(three_h, RA_bins);
% p(1) = plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% 
% hold on
% 
% h = histcounts(three_m, RA_bins);
% p(2) = plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', green, 'MarkerSize', 7);
% 
% hold on
% 
% cum_prob = [];
% h = histcounts(three, RA_bins);
% prob = h/sum(h);
% cum_prob(1) = 0;
% cum_prob(2) = prob(1);
% for i = 3:size(RA_bins(1:end-1), 2)
%     cum_prob(i) = prob(i-1) + cum_prob(i-1);
% end
% 
% p(3) = plot(RA_bins(1:end-1), cum_prob, '-k', 'LineWidth', 1.5); % Cumul. dist.
% 
% ax = gca;
% ax.YTick = [0 0.2 0.4 0.6 0.8 1];
% 
% xlabel('NRA', 'FontSize', 22);
% ylabel('Probability', 'FontSize', 22);
% ylim([0 1]);
% title('200 - 500 m', 'FontSize', 22);
% set(gca, 'FontSize', 22);
% grid on
% 
% % Threshold Line
% 
% script = text(thresh+0.003, 0.51, [num2str(thresh*100) ' % NRA']);
% script.FontSize = 18;
% set(script, 'Rotation', 90);
% 
% % (c)
% 
% c = annotation('textbox', [0.1, 0.51, 0, 0], 'string', '(c)');
% c.FontSize = 20;
% 
% % Highlight Patch 1
% 
% patch([0 thresh thresh 0], [0 0 1 1], red, 'FaceAlpha', 0.1, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Inset Plot
% 
% axes('Position', [0.24 0.16 0.14 0.14]);
% h = histcounts(three_h, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% hold on
% h = histcounts(three_m, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', 'g', 'MarkerSize', 7);
% grid on;
% set(gca, 'FontSize', 15);
% xlim([0 0.03]);
% ylim([0 0.2]);
% 
% % Highlight Patch 2
% 
% patch([0 thresh thresh 0], [0 0 0.3 0.3], red, 'FaceAlpha', 0.1, 'EdgeColor', 'Red', 'LineWidth', 1.5);
% 
% % Legend
% 
% box = legend([p(1) p(2) p(3)], 'Highlands', 'Mare', 'CDF');
% box.FontSize = 20;
% set(box, 'Position', [0.365 0.31 0.1 0.1]);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% subplot(2, 2, 4)
% 
% h = histcounts(four_h, RA_bins);
% p(1) = plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% 
% hold on
% 
% h = histcounts(four_m, RA_bins);
% p(2) = plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', 'g', 'MarkerSize', 7);
% 
% hold on
% 
% cum_prob = [];
% h = histcounts(four, RA_bins);
% prob = h/sum(h);
% cum_prob(1) = 0;
% cum_prob(2) = prob(1);
% for i = 3:size(RA_bins(1:end-1), 2)
%     cum_prob(i) = prob(i-1) + cum_prob(i-1);
% end
% 
% p(3) = plot(RA_bins(1:end-1), cum_prob, '-k'); % Cumul. dist.
% 
% ax = gca;
% ax.YTick = [0 0.2 0.4 0.6 0.8 1];
% 
% xlabel('NRA', 'FontSize', 22);
% ylabel('Probability', 'FontSize', 22);
% ylim([0 1]);
% title('500 m - 1 km', 'FontSize', 22);
% set(gca, 'FontSize', 22);
% grid on
% 
% % (d)
% 
% d = annotation('textbox', [0.54, 0.51, 0, 0], 'string', '(d)');
% d.FontSize = 20;
% 
% % Legend
% 
% box = legend([p(1) p(2) p(3)], 'Highlands', 'Mare', 'CDF');
% box.FontSize = 20;
% set(box, 'Position', [0.805 0.34 0.1 0.1]);
% 
% % Inset Plot
% 
% axes('Position', [0.71 0.175 0.14 0.14]);
% h = histcounts(four_h, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-b', 'MarkerFaceColor', 'b', 'MarkerSize', 7);
% hold on
% h = histcounts(four_m, RA_bins);
% plot(RA_bins(1:end-1), h/sum(h), 'o-g', 'MarkerFaceColor', 'g', 'MarkerSize', 7);
% grid on;
% set(gca, 'FontSize', 15);
% xlim([0 0.03]);
% ylim([0 0.2]);

%% ROCKINESS FRACTION %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Determine a threshold for NRA (threshold) beyond which rockiness is assumed
% to be negligible.
% Boolean system: 1 (NRA > threshold) = rocky, 0 (NRA <= threshold) = not rocky.

% Segment diameter into bins.
% For each diameter bin, find RR = fraction of (all diameter) craters that
% do not have rocks i.e. find for each bin:
% Porportion of rocks with NRA <= threshold

% We expect that as diameter increases, the RR (proportion of craters that
% aren't rocky) will decrease i.e. a larger proportion of rocks will be
% ejected to the surface.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FINDING RR: DIAMETER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

D_bins = 10.^(-2:0.02:4);
units = 3; % 3 = m | 4 = km

P_o = {};
RR = [];
high = [];
mare = [];

for i = 1:(length(D_bins)-1)
    
    % find all ra_data values for all diameter bins
    P_o{i} = ra_data(ra_data(:, units) >= D_bins(i) &...
        ra_data(:, units) < D_bins(i+1), 9);
    
    % Highlands/Mare
    P_o{i}(:, 2) = ra_data(ra_data(:, units) >= D_bins(i) &...
        ra_data(:, units) < D_bins(i+1), 5);
    
    % Find proportion <= threshold
    RR(i, 1) = size(P_o{i}(P_o{i}(:, 1) <= thresh), 1) / size(P_o{i}(:, 1), 1);
    
    high = find(P_o{1, i}(:, 2) == 1);
    mare = find(P_o{1, i}(:, 2) == 0);
    
    RR(i, 2) = size(P_o{i}(P_o{i}(high, 1) <= thresh), 1) / size(P_o{i}(high, 1), 1);
    RR(i, 3) = size(P_o{i}(P_o{i}(mare, 1) <= thresh), 1) / size(P_o{i}(mare, 1), 1);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DROP ALL BINS WITH LESS THAN q CRATERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

q = 3;

n_craters = cellfun('size', P_o, 1);
D_bins(n_craters < q) = [];
RR(n_craters < q, :) = [];
P_o = {P_o{~(n_craters < q)}};
n_craters(n_craters < q) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOTTING HIGHLANDS VS. MARE %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

highmar = figure();

% HIGHLANDS

x = log(transpose(D_bins(1:end-1)));
y = 1-RR(:, 2);
y(isinf(y)|isnan(y)) = 0;

    % errorbars

CI = sqrt(y.*(1-y)./transpose(n_craters));

p1 = errorbar(x, y, CI, CI, 'o',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', 'b',...
    'MarkerSize', 15,...
    'Color', 'b',...
    'LineWidth', 1.5);

hold on

    % nlinfit

modelfun = @(b,x)1./(1+exp(-(b(1).*x-b(2))));
beta0 = [1;1];
beta_h = nlinfit(x,y,modelfun,beta0);
templine = 3.5:0.01:8;
new_y = modelfun(beta_h,templine);
p3 = plot(templine, new_y, '-b', 'LineWidth', 2);

% MARE

x = log(transpose(D_bins(1:end-1)));
y = 1-RR(:, 3);
y(isinf(y)|isnan(y)) = 0;

    % errorbars
    
CI = sqrt(y.*(1-y)./transpose(n_craters));

p2 = errorbar(x, y, CI, CI, 'o',...
    'MarkerEdgeColor', 'k',...
    'MarkerFaceColor', green,...
    'MarkerSize', 15,...
    'Color', green,...
    'LineWidth', 1.5);

hold on

    % nlinfit

modelfun = @(b,x)1./(1+exp(-(b(1).*x-b(2))));
beta0 = [1;1];
beta_m = nlinfit(x,y,modelfun,beta0);
templine = 3.5:0.01:8;
new_y = modelfun(beta_m,templine);
p4 = plot(templine, new_y, '-', 'LineWidth', 2, 'Color', green);

% Axis details

grid on
xlabel('\fontsize{23} Diameter [m]');
y = ylabel({'\fontsize{23} Rockiness Fraction';...
    ['\fontsize{23} P(NRA \geq ', num2str(thresh*100), '%)']});
set(gca, 'FontSize', 23);
ylim([0 1]);
xlim([3.7 6.7]);
yh = get(gca, 'ylabel');
set(yh, 'Position', [3.4893 0.5 -1]);
xticklabels({exp(xticks)});

% Rockiness box labels

annotation('textbox', [0.8 0.08 0.1 0.1], 'String',...
    '\fontsize{23} \color{White} Low Rockiness',...
    'FontWeight', 'bold',...
    'EdgeColor', 'Black', 'BackgroundColor', 'Black',...
    'FaceAlpha', 0.8);
annotation('textbox', [0.8 0.8 0.1 0.1], 'String',...
    '\fontsize{23} \color{White} High Rockiness',...
    'FontWeight', 'bold',...
    'EdgeColor', 'Black', 'BackgroundColor', 'Black',...
    'FaceAlpha', 0.8);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regolith thickness vert. lines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 50% craters horz. line

x_extent = get(gca, 'XLim');
plot([x_extent(1) x_extent(2)], [0.5 0.5], '--k', 'LineWidth', 3);
script = text(5.6, 0.54, ['50% craters with \geq ', num2str(thresh*100), '% NRA']);
script.FontSize = 23;

% 50% references

high_dia = (beta_h(2) - log(1/0.5 - 1) )/beta_h(1); % m
mare_dia = (beta_m(2) - log(1/0.5 - 1) )/beta_m(1); % m

plot([high_dia high_dia], [0 1], '--b', 'LineWidth', 3);
plot([mare_dia mare_dia], [0 1], '--', 'Color', green, 'LineWidth', 3);

% Legend

box = legend([p1,p2,p3,p4], 'Highlands', 'Mare',...
    ['$$\frac{1}{ 1 + e^{-(' num2str(round(beta_h(1),2)) 'x - '  num2str(round(beta_h(2),2)) ')}}$$'],...
    ['$$\frac{1}{ 1 + e^{-(' num2str(round(beta_m(1),2))  ' x - ' num2str(round(beta_m(2),2)) ')}}$$'],...
    'Interpreter', 'Latex', 'NumColumns', 2);
box.FontSize = 25;
set(box, 'Position', [0.62 0.3 0.2 0.1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DEPTH AXIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MELOSH: Second x-axis

%depth_multiplier = 0.084; % Melosh
depth_multiplier = 0.0252; % Sharpton

ax1 = gca();
ax1_pos = ax1.Position; % position of first axis
ax3 = axes('Position', ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none', ...
    'YTick', []);

linkprop([ax1 ax3], 'XLim');
ax3.XTickLabel = cellfun(@num2str, num2cell(x3), 'UniformOutput', false);

grid on

xlabel('\fontsize{23}Excavation Depth [m]');
set(gca, 'FontSize', 23)

% Diameter/Depth Text

high_dep = exp(high_dia)*depth_multiplier; % m
mare_dep = exp(mare_dia)*depth_multiplier; % m

    % Highlands
    h1 = high_dia+0.06;
    h2 = 0-0.1;
    script = text(h1, h2, ['D = ', num2str(round(exp(high_dia),2)), ' m']);
    script.FontSize = 23;
    set(script, 'Rotation', 90);
    script = text(h1+0.09, h2, ['d_e = ', num2str(round(high_dep,2)), ' m']);
    script.FontSize = 23;
    set(script, 'Rotation', 90);

    % Mare
    m1 = mare_dia-2.5*0.06;
    m2 = 0.65;
    script = text(m1, m2, ['D = ', num2str(round(exp(mare_dia),2)), ' m']);
    script.FontSize = 23;
    set(script, 'Rotation', 90);
    script = text(m1+0.09, m2, ['d_e = ', num2str(round(mare_dep,2)), ' m']);
    script.FontSize = 23;
    set(script, 'Rotation', 90);



