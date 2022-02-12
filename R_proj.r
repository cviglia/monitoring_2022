# my project 

# The Normalized Difference Water Index (NDWI) is known to be strongly related to the plant water content. It is therefore a very good proxy for plant water stress.  
# It is obtained by the following equation: NDWI = (NIR - MIR)/ (NIR + MIR), using Sentinel-2 Band 8 (NIR = MODIS band 2) and Band 12 (MIR /SWIR= MODIS band 6).
# Visible and Near Infrared (VNIR), Short Wave Infrared (SWIR).
# The NDWI is a vegetation index sensitive to the water content of vegetation and is complementary to the NDVI. 
# High NDWI values show a high water content of the vegetation.

# The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes, a proxy to quantify the vegetation amount.
# Even though it is not a physical property of the vegetation cover, it has a very simple formulation NDVI = (REF_nir – REF_red)/(REF_nir + REF_red) 
# where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, that makes it widely used for ecosystems monitoring.
# Using Sentinel-2 it is  expressed as (B8-B4)/(B8+B4).
# The NDVI is widely used by the bio-geophysical community to monitor the vegetation state and disturbances to address a large range of applications, 
# including forestry, agriculture, food security, water management.
# Very low values of NDVI (0.1 and below) correspond to barren areas of rock, sand, or snow. Moderate values represent shrub and grassland (0.2 to 0.3), 
# while high values indicate temperate and tropical rainforests (0.6 to 0.8).

# https://gisgeography.com/sentinel-2-bands-combinations/
# https://modis.gsfc.nasa.gov/about/specifications.php
# https://apps.sentinel-hub.com/eo-browser/

# coordinates of Sicily (longitude 11.9256 - 15.6528; latitude 35.4929 - 38.8122)

# bosco ficuzza long lat (13.40100, 37.91054)

# parco dell'etna long lat (14.9910188438527,37.7484444540323)
# parco delle madonie long lat (14.02685,37.86626)
# riserva cavagrande long lat (15.0969771982218,36.9768781858837)


# require libraries
pacman::p_load(sf, sp, rgdal, raster, rgeos, rasterVis, 
               RStoolbox, dplyr, writexl, ggplot2)


# set working directory
setwd("C:/lab//my/") 

NIR <- raster("NDVI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 4)
r <- raster("NDVI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 3)
g <- raster("NDVI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 2)
b <- raster("NDVI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 1)


rgbndvi20161209 <- brick(b,g,r)
plotRGB(rgbndvi20161209, r = 3, g = 2, b = 1, stretch = "lin")

mbr <- brick("NDVI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg")
plotRGB(mbr, r = 3, g = 2, b = 1, stretch = "lin")


NDVI_20161209 <- (mbr$B8-mbr$B4)/(mbr$B8+mbr$B4)



# calculate NDVI using "spectralindices()" function
NDVI_20161209 <- spectralIndices(rgbndvi20161209, 
                                red = 3, nir = 4,  
                                index = "NDVI")
plot(NDVI_20161209)

# import spatialpoints
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# extract NDVI values for each point by using the spatial points data frame
extr_NDVI <- extract(NDVI, cluster, 
                     method = "simple", df = TRUE)
???

# save NDVI raster as a .tif file
writeRaster(extr_NDVI, /C:/lab//my/"/NDVI_test.tif")















