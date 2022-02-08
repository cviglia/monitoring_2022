# my project 

# The Leaf Area Index (LAI) is defined as half the total area of green elements of the canopy per unit horizontal ground area. 

# The satellite-derived value corresponds to the total green LAI of all the canopy layers, including the understory which may represent a very significant contribution, 
# particularly for forests. Practically, the LAI quantifies the thickness of the vegetation cover.

# LAI is recognized as an Essential Climate Variable (ECV) by the Global Climate Observing System (GCOS).

# The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes, a proxy to quantify the vegetation amount.

# Even though it is not a physical property of the vegetation cover, it has a very simple formulation NDVI = (REF_nir – REF_red)/(REF_nir + REF_red) 
# where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, that makes it widely used for ecosystems monitoring.

# The surface albedo quantifies the fraction of the sunlight reflected by the surface of the Earth. Different albedo concepts are defined
# and we will focus on the directional albedo or directional-hemispherical reflectance. It is also called black-sky albedo and it is the integration of
# the bi-directional reflectance over the viewing hemisphere. It assumes all energy is coming from a direct radiation from the sun and is computed for a specific time.

# The Global Climate Observing System (GCOS) specified the black-sky albedo as an Essential Climate Variable and the product is required for climate change purposes.

# Albedo is a key forcing parameter controlling the planetary radiative energy budget and the partitioning of radiative energy between the atmosphere and surface. 

# The energy absorbed at the surface is used to drive vegetation processes such as evapotranspiration, photosynthesis and carbon assimilation, 
# and govern temperature-related processes such as evaporation, and snow melt. 

# Thus albedo varies in space and time as a result of both natural processes (e.g. changes in solar position, inundation and vegetation growth) 
# and human activities (e.g. clearing and planting forests, sowing and harvesting crops, burning rangeland). It is a sensitive indicator of environmental vulnerability. 

# Seasonal vegetation phenology can significantly alter surface albedo which in turn affects the global energy balance 
# and the albedo warming/cooling feedbacks that impact climate change. 

# The NDVI is widely used by the bio-geophysical community to monitor the vegetation state and disturbances to address a large range of applications, 
# including forestry, agriculture, food security, water management.

# Very low values of NDVI (0.1 and below) correspond to barren areas of rock, sand, or snow. Moderate values represent shrub and grassland (0.2 to 0.3), 
# while high values indicate temperate and tropical rainforests (0.6 to 0.8).

# coordinates of Sicily (longitude 11.9256 - 15.6528; latitude 35.4929 - 38.8122)

# bosco ficuzza long lat (13.40100, 37.91054)
# parco dell'etna long lat (14.9910188438527,37.7484444540323)
# parco delle madonie long lat (14.02685,37.86626)
# riserva cavagrande long lat (15.0969771982218,36.9768781858837)

# libraries
pacman::p_load(sp, rgdal, raster, rgeos, rasterVis, 
               RStoolbox, dplyr, writexl, ggplot2, ncdf4)

setwd("C:/lab//my/") 

# list the images
listndvi <- list.files(pattern = "NDVI")
# apply a function to a list: import single layers images
importndvi <- lapply(listndvi, raster) 
# put all the images together
stackndvi <- stack(importndvi) 
# crop the stack: coordinates of Sicily
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
ndvi_cropped <- crop(stackndvi, ext)


# create a list with the images
listaldh <- list.files(pattern = "ALDH")
# import single layers images
importaldh <- lapply(listaldh, raster) 
# put all the images together
stackaldh <- stack(importaldh)
# crop the stack
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
aldh_cropped <- crop(stackaldh, ext)


# create a list with the images
listlai <- list.files(pattern = "LAI") 
# import single layers images
importlai <- lapply(listlai, raster)
# put all the images together
stacklai <- stack(importlai) 
# crop the stack
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
lai_cropped <- crop(stacklai, ext)


# import spatialpoints
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# plot ALDH, NDVI and LAI, add points
par(mfrow=c(1,3))
plot(aldh_cropped[[1]])
plot(cluster, add = TRUE)
plot(ndvi_cropped[[1]])
plot(cluster, add = TRUE)
plot(lai_cropped[[1]])
plot(cluster, add = TRUE)




# extract raster values: 4 chosen points each one
aldh_values <- extract(aldh_cropped, cluster,
                       method = "simple", df = TRUE)

aldh2015_values <- extract(aldh_cropped[[1]], cluster, 
                          method = "simple", df = TRUE)
aldh2016_values <- extract(aldh_cropped[[3]], cluster, 
                          method = "simple", df = TRUE)
aldh2017_values <- extract(aldh_cropped[[5]], cluster, 
                          method = "simple", df = TRUE)
aldh2018_values <- extract(aldh_cropped[[7]], cluster, 
                          method = "simple", df = TRUE)
aldh2019_values <- extract(aldh_cropped[[9]], cluster, 
                          method = "simple", df = TRUE)
aldh2020_values <- extract(aldh_cropped[[11]], cluster, 
                          method = "simple", df = TRUE)

ndvi_values <- extract(ndvi_cropped, cluster, 
                          method = "simple", df = TRUE)

ndvi2015_values <- extract(ndvi_cropped[[1]], cluster, 
                          method = "simple", df = TRUE)
ndvi2016_values <- extract(ndvi_cropped[[3]], cluster, 
                          method = "simple", df = TRUE)
ndvi2017_values <- extract(ndvi_cropped[[5]], cluster, 
                          method = "simple", df = TRUE)
ndvi2018_values <- extract(ndvi_cropped[[7]], cluster, 
                          method = "simple", df = TRUE)
ndvi2019_values <- extract(ndvi_cropped[[9]], cluster, 
                          method = "simple", df = TRUE)
ndvi2020_values <- extract(ndvi_cropped[[11]], cluster, 
                          method = "simple", df = TRUE)

lai_values <- extract(lai_cropped, cluster, 
                          method = "simple", df = TRUE)

lai2015_values <- extract(lai_cropped[[1]], cluster, 
                          method = "simple", df = TRUE)
lai2016_values <- extract(lai_cropped[[2]], cluster, 
                          method = "simple", df = TRUE)
lai2017_values <- extract(lai_cropped[[3]], cluster, 
                          method = "simple", df = TRUE)
lai2018_values <- extract(lai_cropped[[4]], cluster, 
                          method = "simple", df = TRUE)
lai2019_values <- extract(lai_cropped[[5]], cluster, 
                          method = "simple", df = TRUE)
lai2020_values <- extract(lai_cropped[[6]], cluster, 
                          method = "simple", df = TRUE)


# give names to the values of bosco ficuzza (the first of four)
aldh1 <- 0.1196 # albedo bosco ficuzza 2015
aldh2 <- 0.1055 # albedo bosco ficuzza 2016
aldh3 <- 0.1029 # albedo bosco ficuzza 2017
aldh4 <- 0.1169 # albedo bosco ficuzza 2018
aldh5 <- 0.1210 # albedo bosco ficuzza 2019
aldh6 <- 0.1208 # albedo bosco ficuzza 2020

ndvi1 <- 0.59600002 # vegetation index bosco ficuzza 2015
ndvi2 <- 0.93200004 # vegetation index bosco ficuzza 2016
ndvi3 <- 0.9280000  # vegetation index bosco ficuzza 2017
ndvi4 <- 0.9280000  # vegetation index bosco ficuzza 2018
ndvi5 <- 0.9280000  # vegetation index bosco ficuzza 2019
ndvi6 <- 0.65200001 # vegetation index bosco ficuzza 2020

lai1 <- 1.666650 # leaf area bosco ficuzza 2015
lai2 <- 3.333300 # leaf area bosco ficuzza 2016
lai3 <- 1.899981 # leaf area bosco ficuzza 2017
lai4 <- 1.733316 # leaf area bosco ficuzza 2018
lai5 <- 1.966647 # leaf area bosco ficuzza 2019
lai6 <- 1.899981 # leaf area bosco ficuzza 2020


# single graphs
ndvi <- c(0.59600002, 0.93200004, 0.9280000, 0.9280000, 0.9280000, 0.65200001)
plot(ndvi, type = "o", col = "dark green")
title(main = "Vegetation of Bosco Ficuzza", col.main="black", font.main=4)

aldh <- c(0.1196, 0.1055, 0.1029, 0.1169, 0.1210, 0.1208)
plot(aldh, type = "o", col = "dark red")
title(main = "Albedo of Bosco Ficuzza", col.main="black", font.main=4)

lai <- c(1.666650, 3.333300, 1.899981, 1.733316, 1.966647, 1.899981)
plot(lai, type = "o", col = "orange")
title(main = "Leaf Area of Bosco Ficuzza", col.main="black", font.main=4)


# unite graphs 
# calculate range from 0 to max value 
g_range <- range(0, ndvi, aldh, lai)

# graph. Turn off axes and annotations (axis labels) 
plot(ndvi, type="o", col="dark green", ylim=g_range, 
   axes=FALSE, ann=FALSE)

# make x axis using labels
axis(1, at=1:6, lab=c("2015","2016","2017","2018","2019", "2020"))

# make y axis with horizontal labels 
axis(2, las=1)

# create box around plot
box()

# graph albedo with red dashed line and square points
lines(aldh, type="o", pch=22, lty=2, col="dark red")
lines(lai, type="o", pch=23, lty=2, col="orange")


# create a title 
title(main="Bosco Ficuzza", col.main="black", font.main=4)

# label the x and y axes 
title(xlab="Years")
title(ylab="Values")

# create a legend at (1, g_range[2]) that is slightly smaller (cex) 
legend("topright", g_range[2], c("Normalized Difference Vegetation","Albedo", "Leaf Area"), cex=0.9, 
   col=c("dark green","dark red", "orange"), pch=21:22, lty=1:2)



# scatterplot bosco ficuzza
# is there a correlation between lai and aldh?
x <- lai
y <- aldh

# plot with main and axis titles
plot(x, y, main = "Correlation",
     xlab = "Leaf Area", ylab = "Albedo",
     pch = 19, col = "brown")


















