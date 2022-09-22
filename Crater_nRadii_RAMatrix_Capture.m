% Start_file: 07/09/2018
% End_file: 07/12/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pulls Rock Abundance Values from Diviner Map, corresponding to each cold
% spot crater in the provided dataset. Extracts rock abundance n crater
% radii out from the crater center in a square matrix.

clc
clear
close all

%% READ IN DATA %%

% Pierre's updated database of cold spot craters
cslist_2282 = xlsread("/Users/Jaahnavee/Documents/RA Regolith Thickness/Final Code and Data/cslist_copy.xlsx");

%% FINDING THE SCENE ROCK ABUNDANCE (RA) VALUES %%

% Feeds in Pierre's database of cold spot craters and finds the rock
% abundance matrices for the area n radii out from each crater.

% Number of radii out from the center n

n = 3;

% km to Lat/Lon multiplication factor (km at equator)

f = 30;

% Find the n radii matrix of RA values for each crater in database

sceneRA = {};
for i = 1:size(cslist_2282, 1)
    
    row = i;

    lon = cslist_2282(row, 1);
    lat = cslist_2282(row, 2);
    Diameter = cslist_2282(row, 4); % km

    % Find the range

    lon_range = [lon - (n*(Diameter/2))/f lon + (n*(Diameter/2))/f];
    lat_range = [lat - (n*(Diameter/2))/f lat + (n*(Diameter/2))/f];

    % Rock Abundance
    sceneRA{i} = getscene_RA_SCM(lon_range, lat_range);
    
end

%% FINDING THE SUMMARY RA VALUES %%

% Get the min, max, and mean values of RA for each crater matrix

RA = [];
for i = 1:size(cslist_2282, 1)
    
% Find the max, min, and average values of RA

    RA(i, 1) = min(min(cell2mat(sceneRA(i)))); % minimum
    RA(i, 2) = max(max(cell2mat(sceneRA(i)))); % maximum
    RA(i, 3) = mean(mean(cell2mat(sceneRA(i)))); % average
    
end

% Join surface (Highlands vs. Mare) and RA data

RA = [cslist_2282 RA];

%% NORMALIZED RA (NRA) VALUES %%

% Based on surrounding rock abundance (maximum - mean)

RA_norm = [];
for i = 1:size(RA, 1)
    RA_norm(i, 1) = RA(i, 7) - RA(i, 8);
end

%% WRITE DATA TO CSV %%

% RA COLUMNS: RA_min, RA_max, RA_mean, NRA

% COMBINED CSV COLUMNS:
%-----------------------
% Longitude [1]
% Latitude [2]
% Diameter_m [3]
% Diameter_km [4]
% Surface(0 = Mare, 1 = Highlands) [5]
% RA_min [6]
% RA_max [7]
% RA_mean [8]
% NRA [9]

NRA_data = [RA RA_norm];

%csvwrite('NRA_data_withNaNs.csv', NRA_data);
NRA_data(any(isnan(NRA_data), 2), :) = []; % Remove rows with NAs
csvwrite('/Users/jaahnavee/Desktop/New_Maps_New_CS_NRA.csv', NRA_data); % save to local directory









