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

# require libraries
pacman::p_load(sf, sp, ncdf4, rgdal, raster, rgeos, rasterVis, 
               RStoolbox, dplyr, writexl, ggplot2)

# set working directory
setwd("C:/lab//my/") 

# NDVI from Copernicus
# list the images
listndvi <- list.files(pattern = "NDVI")
# apply a function to a list: import single layers images
importndvi <- lapply(listndvi, raster) 
# put all the images together
stackndvi <- stack(importndvi) 

# create the palette
cl <- colorRampPalette(c("chocolate4","darkgoldenrod4","darkolivegreen","chartreuse4","darkgreen"))(100)

# give names
ndvi2016 <- stackndvi[[1]]
ndvi2017 <- stackndvi[[2]]
ndvi2018 <- stackndvi[[3]]
ndvi2019 <- stackndvi[[4]]
ndvi2020 <- stackndvi[[5]]

# plot the images with a palette
png()
par(mfrow=c(3,2))
plot(stackndvi[[1]], col = cl, main = "NDVI2016")
plot(stackndvi[[2]], col = cl, main = "NDVI2017")
plot(stackndvi[[3]], col = cl, main = "NDVI2018")
plot(stackndvi[[4]], col = cl, main = "NDVI2019")
plot(stackndvi[[5]], col = cl, main = "NDVI2020")
dev.off()

# crop the stack: coordinates of Sicily
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
ndvi_cropped <- crop(stackndvi, ext)

# give names
ndvi16_sic <- ndvi_cropped[[1]]
ndvi17_sic <- ndvi_cropped[[2]]
ndvi18_sic <- ndvi_cropped[[3]]
ndvi19_sic <- ndvi_cropped[[4]]
ndvi20_sic <- ndvi_cropped[[5]]

# plot the cropped images with a palette
png()
par(mfrow=c(3,2))
plot(ndvi_cropped[[1]], col = cl, main = "NDVI2016")
plot(ndvi_cropped[[2]], col = cl, main = "NDVI2017")
plot(ndvi_cropped[[3]], col = cl, main = "NDVI2018")
plot(ndvi_cropped[[4]], col = cl, main = "NDVI2019")
plot(ndvi_cropped[[5]], col = cl, main = "NDVI2020")
dev.off()

# import spatialpoint
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# plot NDVI, add point
plot(ndvi16_sic, col = cl)
plot(cluster, add = TRUE)

# plot with ggplot function 
# palette cividis to include colour blind people
ndvi2016_sic <- ggplot() + geom_raster(ndvi16_sic, mapping = aes(x = x, y = y, fill = NDVI2016)) + scale_fill_viridis(option="cividis"), fill="transparent", color="black", lwd=0.8) + ggtitle("NDVI 2016")
ndvi2017_sic <- ggplot() + geom_raster(ndvi17_sic, mapping = aes(x = x, y = y, fill = NDVI2017)) + scale_fill_viridis(option="cividis"), fill="transparent", color="black", lwd=0.8) + ggtitle("NDVI 2017")
ndvi2018_sic <- ggplot() + geom_raster(ndvi18_sic, mapping = aes(x = x, y = y, fill = NDVI2018)) + scale_fill_viridis(option="cividis"), fill="transparent", color="black", lwd=0.8) + ggtitle("NDVI 2018")
ndvi2019_sic <- ggplot() + geom_raster(ndvi19_sic, mapping = aes(x = x, y = y, fill = NDVI2019)) + scale_fill_viridis(option="cividis"), fill="transparent", color="black", lwd=0.8) + ggtitle("NDVI 2019")
ndvi2020_sic <- ggplot() + geom_raster(ndvi20_sic, mapping = aes(x = x, y = y, fill = NDVI2020)) + scale_fill_viridis(option="cividis"), fill="transparent", color="black", lwd=0.8) + ggtitle("NDVI 2020")


# NDWI from Sentinel-2
r <- raster("ndwi2016.tif", band = 3)
g <- raster("ndwi2016.tif", band = 2)
b <- raster("ndwi2016.tif", band = 1)


rgbndwi20161209 <- brick(b,g,r)
plotRGB(rgbndwi20161209, r = 3, g = 2, b = 1, stretch = "lin")

















