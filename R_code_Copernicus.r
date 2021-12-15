# code for Copernicus
library(ncdf4)
library(raster)

# set the working directory
setwd("C:/lab//copernicus/") 

# raster
leaf01052020 <- raster("c_gls_LAI-RT0_202006300000_GLOBE_PROBAV_V2.0.1.nc")
leaf01052020

# plot the data
plot(leaf01052020)
