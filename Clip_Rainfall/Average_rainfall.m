

%% loading data

load('lon_rain.mat');
load('lat_rain.mat');
load('rainnew.mat')

shapefile=shaperead('Periyarbasin.shp') ;  % reading shapefile 

%% cropping rainfall using shapefile
%RLat=37.5+0.125:-0.25:7.5-0.125 ; % raster latitude  % lat and long of corners are considered( not centre)
RLat = max(lat)+0.125:-(lat(1,1)-lat(2,1)):min(lat)-0.125;
%RLat =89.5+0.5:-1:-89.5-0.5;
RLat=RLat' ;

%RLon=67.5-0.125:0.25:97.5+0.125 ;
% raster longitude 
RLon = min(lon)-0.125:lon(2,1)-lon(1,1):max(lon)+0.125;
%RLon=0-0.5:1:359+0.5;
RLon=RLon' ;

for i=1:size(rainnew,1)
   
   PLat=shapefile.Y' ;                    % polygon latitude 
   PLon=shapefile.X' ;                     % polygon longitude 
   rain_avg(i,1)=clip_RasterByPolygon(rainnew{i,1},RLat,RLon,PLat,PLon,'AveragebyArea') ;
   clear PLat PLon
end

year_type = "a";
Daily = rain_avg;
d1 = 01;
m1 = 01;
y1 = 1951;
d2 = 31;
m2 = 12;
y2 = 2022;
[Month, MaxMonth, MinMonth, Year_cnt, Year]= Daily2Month(Daily,d1,m1,y1,d2,m2,y2,year_type);
MonthlyMeanRain = mean(Month');
MonthlyMeanRain =MonthlyMeanRain';
plot((rain_avg(1:365)));

%% saving output file

save Daily Daily
save MonthlyMeanRain MonthlyMeanRain
