
%%IMD rainfall data conversion

ncfile = 'C:\Users\mergedrainfall.nc';
dh = ncinfo(ncfile);
lon = ncread(ncfile,'LONGITUDE') ; % reading longitude
lat = ncread(ncfile,'LATITUDE') ; % reading latitude
lat = flip(lat);
time = ncread(ncfile,'TIME'); % reading time
pr = ncread(ncfile,'RAINFALL') ;

RAIN_new = cell(size(time,1),1);
[RAIN_new{:}]=  deal(zeros(size(lat,1),size(lon,1)));
for i =1:size(time,1)
RAIN_new{i,1}= pr(:,:,i);
end
for i =1:size(time,1)
    RAIN_new{i}= RAIN_new{i}';
end

%%Reverse order (data format required for finding average rainfall over a region
    for i =1:size(time,1)
        rainnew{i,1}= flip(RAIN_new{i,1});
    end

%% saving the data

save lat.mat lat
save lon.mat lon
save rainnew.mat rainnew
