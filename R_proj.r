# my project 

# The Normalized Difference Water Index (NDWI) is known to be strongly related to the plant water content. It is therefore a very good proxy for plant water stress.  
# It is obtained by the following equation: NDWI = (NIR - SWIR)/ (NIR + SWIR), using Sentinel-2 Band 8 (NIR = MODIS band 2) and Band 12 (SWIR= MODIS band 6).
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
               RStoolbox, dplyr, ggplot2, viridis, patchwork, gridExtra)

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
par(mfrow=c(3,2))
plot(ndvi2016, col = cl, main = "NDVI2016")
plot(ndvi2017, col = cl, main = "NDVI2017")
plot(ndvi2018, col = cl, main = "NDVI2018")
plot(ndvi2019, col = cl, main = "NDVI2019")
plot(ndvi2020, col = cl, main = "NDVI2020")

# crop the stack: coordinates of Sicily
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
ndvicropped <- crop(stackndvi, ext)

# give names
ndvi16sic <- ndvicropped[[1]]
ndvi17sic <- ndvicropped[[2]]
ndvi18sic <- ndvicropped[[3]]
ndvi19sic <- ndvicropped[[4]]
ndvi20sic <- ndvicropped[[5]]

# plot the cropped images with a palette
par(mfrow=c(3,2))
plot(ndvi16sic, col = cl, main = "NDVI2016")
plot(ndvi17sic, col = cl, main = "NDVI2017")
plot(ndvi18sic, col = cl, main = "NDVI2018")
plot(ndvi19sic, col = cl, main = "NDVI2019")
plot(ndvi20sic, col = cl, main = "NDVI2020")

# import spatialpoint
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# plot NDVI, add point
plot(ndvi16sic, col = cl, main = "Bosco della Ficuzza")
plot(cluster, add = TRUE, main = "Bosco della Ficuzza")

# plot with ggplot function 
# palette cividis to include colourblind people
ndvi2016_sic <- ggplot() + geom_raster(ndvi16sic, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.1)) + scale_fill_viridis(option="cividis") + ggtitle("NDVI in December 2016") + labs(fill = "NDVI")
ndvi2017_sic <- ggplot() + geom_raster(ndvi17sic, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.2)) + scale_fill_viridis(option="cividis") + ggtitle("NDVI in December 2017") + labs(fill = "NDVI")
ndvi2018_sic <- ggplot() + geom_raster(ndvi18sic, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.3)) + scale_fill_viridis(option="cividis") + ggtitle("NDVI in December 2018") + labs(fill = "NDVI")
ndvi2019_sic <- ggplot() + geom_raster(ndvi19sic, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.4)) + scale_fill_viridis(option="cividis") + ggtitle("NDVI in December 2019") + labs(fill = "NDVI")
ndvi2020_sic <- ggplot() + geom_raster(ndvi20sic, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.5)) + scale_fill_viridis(option="cividis") + ggtitle("NDVI in December 2020") + labs(fill = "NDVI")


# NDWI from Sentinel-2
# area of bosco ficuzza

# list
listndwi <- list.files(pattern = "NDWI")
# import
importndwi <- lapply(listndwi, raster) 
# stack
stackndwi <- stack(importndwi) 

# give names
ndwi2016 <- stackndwi[[1]]
ndwi2017 <- stackndwi[[2]]
ndwi2018 <- stackndwi[[3]]
ndwi2019 <- stackndwi[[4]]
ndwi2020 <- stackndwi[[5]]

# plot together
par(mfrow=c(3,2))
plot(ndwi2016, main = "NDWI2016")
plot(ndwi2017, main = "NDWI2017")
plot(ndwi2018, main = "NDWI2018")
plot(ndwi2019, main = "NDWI2019")
plot(ndwi2020, main = "NDWI2020")

# import specific bands 2016
r <- raster("NDWI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 3)
g <- raster("NDWI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 2)
b <- raster("NDWI_2016-12-09-00_00_2016-12-09-23_59_Sentinel-2_L2A_.jpg", band = 1)

# convert multiple layers in a brick
rgbndwi2016 <- brick(b, g, r)

# make a Red-Green-Blue plot based on three layers
plotRGB(rgbndwi2016, r = 3, g = 2, b = 1, stretch = "lin")

# name
p1 <- ggRGB(rgbndwi2016, r = 3, g = 2, b = 1, stretch = "lin") + ggtitle("2016")


# import specific bands 2017
r2 <- raster("NDWI_2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_.jpg", band = 3)
g2 <- raster("NDWI_2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_.jpg", band = 2)
b2 <- raster("NDWI_2017-12-24-00_00_2017-12-24-23_59_Sentinel-2_L2A_.jpg", band = 1)

# convert multiple layers in a brick
rgbndwi2017 <- brick(b2, g2, r2)

# make a Red-Green-Blue plot
plotRGB(rgbndwi2017, r = 3, g = 2, b = 1, stretch = "lin")

# name
p2 <- ggRGB(rgbndwi2017, r = 3, g = 2, b = 1, stretch = "lin") + ggtitle("2017")


# import specific bands 2018
r3 <- raster("NDWI_2018-10-25-00_00_2018-10-25-23_59_Sentinel-2_L2A_.jpg", band = 3)
g3 <- raster("NDWI_2018-10-25-00_00_2018-10-25-23_59_Sentinel-2_L2A_.jpg", band = 2)
b3 <- raster("NDWI_2018-10-25-00_00_2018-10-25-23_59_Sentinel-2_L2A_.jpg", band = 1)

# convert multiple layers in a brick
rgbndwi2018 <- brick(b3, g3, r3)

# make a Red-Green-Blue plot
plotRGB(rgbndwi2018, r = 3, g = 2, b = 1, stretch = "lin")

# name
p3 <- ggRGB(rgbndwi2018, r = 3, g = 2, b = 1, stretch = "lin") + ggtitle("2018")


# import specific bands 2019
r4 <- raster("NDWI_2019-12-04-00_00_2019-12-04-23_59_Sentinel-2_L2A_.jpg", band = 3)
g4 <- raster("NDWI_2019-12-04-00_00_2019-12-04-23_59_Sentinel-2_L2A_.jpg", band = 2)
b4 <- raster("NDWI_2019-12-04-00_00_2019-12-04-23_59_Sentinel-2_L2A_.jpg", band = 1)

# convert multiple layers in a brick
rgbndwi2019 <- brick(b4, g4, r4)

# make a Red-Green-Blue plot
plotRGB(rgbndwi2019, r = 3, g = 2, b = 1, stretch = "lin")

# name
p4 <- ggRGB(rgbndwi2019, r = 3, g = 2, b = 1, stretch = "lin") + ggtitle("2019")


# import specific bands 2019
r5 <- raster("NDWI_2020-12-23-00_00_2020-12-23-23_59_Sentinel-2_L2A_.jpg", band = 3)
g5 <- raster("NDWI_2020-12-23-00_00_2020-12-23-23_59_Sentinel-2_L2A_.jpg", band = 2)
b5 <- raster("NDWI_2020-12-23-00_00_2020-12-23-23_59_Sentinel-2_L2A_.jpg", band = 1)

# convert multiple layers in a brick
rgbndwi2020 <- brick(b5, g5, r5)

# make a Red-Green-Blue plot
plotRGB(rgbndwi2020, r = 3, g = 2, b = 1, stretch = "lin")

# name
p5 <- ggRGB(rgbndwi2020, r = 3, g = 2, b = 1, stretch = "lin") + ggtitle("2020")

# multiframe
(p2+p3)/(p4+p5)

