# my project

library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)
library(patchwork)

setwd("C:/lab//copernicus/") 

veg20210101 <- raster("c_gls_NDVI300_202101010000_GLOBE_PROBAV_V1.0.1.nc")
veg20210101
plot(veg20210101)

ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1_cropped <- crop(veg20210101, ext)
plot(veg1_cropped <- crop(veg20210101, ext))


veg20200101 <- raster("c_gls_NDVI300_202001010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200101
plot(veg20200101)

ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2_cropped <- crop(veg20200101, ext)
plot(veg2_cropped <- crop(veg20200101, ext))

