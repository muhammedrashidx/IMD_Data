# IMD_Data
Convert IMD data files in Matlab

The India Meteorological Department provides daily gridded rainfall and temperature data sets, which are available for download here:

Rainfall 0.25 x 0.25 (NetCDF) - https://www.imdpune.gov.in/cmpg/Griddata/Rainfall_25_NetCDF.html

Maximum Temperature 1.0 x 1.0 (GRD) - https://www.imdpune.gov.in/cmpg/Griddata/Max_1_Bin.html

Minimum Temperature 1.0 x 1.0 (GRD) - https://www.imdpune.gov.in/cmpg/Griddata/Min_1_Bin.html

Contents:

* `Rainfall.m` : MATLAB code to convert rainfall data to mat file.
  
* `Temerature.m` : MATLAB code to convert temperature data to mat file.
  
* `Clip_rainfall` : Directory containing MATLAB code to find the average rainfall over a river basin. (The data used in this code (lat_rain, lon_rain, rainnew) are generated from the `Rainfall.m` code)
