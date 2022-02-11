# my project 

# The Normalized Difference Water Index (NDWI) is known to be strongly related to the plant water content. It is therefore a very good proxy for plant water stress.  
# It is obtained by the following equation: NDWI = (NIR - MIR)/ (NIR + MIR). While using Sentinel-2 Band 8 (NIR) and Band 12 (MIR).
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


#################### NDVI Calculation
# create a list of files with similar pattern by using "list.files()" function
# "list.files()" produce a character vector of the names of files or directories in the named directory
rlist_NDVI <- list.files(pattern = "NDVI", 
                         full.names = TRUE)
rlist_NDVI

# use "lapply()" function over a list of vector to import them
import <- lapply(rlist_NDVI, raster)
import

# create a stack of the rasters for NDVI analysis by using "stack()" function
# 1 layer raster from several
rstack_NDVI <- stack(import)
plotRGB(rstack_NDVI, 3, 2, 1, stretch = "lin")

# Calculate NDVI using "spectralindices()" function
NDVI_20180827 <- spectralIndices(rstack_20180827, 
                                 red = 3, nir = 4,
                                 indices = "NDVI")
plot(NDVI_20180827)


# Extract NDVI values for each point by using the spatial points data frame
NDVI_20180827 <- extract(NDVI_20180827, cluster, 
                             method = "simple", df = TRUE)
# Save NDVI raster as a .tif file
writeRaster(NDVI_20180827, /C:/lab//my/"/NDVI_test.tif")















