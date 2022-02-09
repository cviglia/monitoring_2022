# my project 

# It has been proven that drought phenomena are affecting southern Mediterranean areas. 
# One of the effects of a persistent drought is a modification of the vegetation cover and biomass. 
# The aim of my presentation is to monitor the evolution of this phenomenon in Sicily using remote sensing techniques. 

# The Soil Water Index (SWI) quantifies the moisture condition at various depths in the soil. It is mainly driven by precipitations via the process of infiltration. 

# Soil moisture is a very heterogeneous variable and varies on small scales with soil properties and drainage patterns. 
# Satellite measurements integrate over relative large-scale areas, with the presence of vegetation adding complexity to the interpretation. 
# The soil moisture, up to 5cm soil depth, is recognized as an Essential Climate Variable (ECV) by the Global Climate Observing System (GCOS). 

# The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes, a proxy to quantify the vegetation amount.
# Even though it is not a physical property of the vegetation cover, it has a very simple formulation NDVI = (REF_nir – REF_red)/(REF_nir + REF_red) 
# where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, that makes it widely used for ecosystems monitoring.
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

# list the images
listswi <- list.files(pattern = "SWI")
# apply a function to a list: import single layers images
importswi <- lapply(listswi, raster) 
# put all the images together
stackswi <- stack(importswi) 
# crop the stack: coordinates of Sicily
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
swi_cropped <- crop(stackswi, ext)


# import spatialpoints
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# plot NDVI and SWI, add points
par(mfrow=c(1,2))
plot(ndvi_cropped[[1]])
plot(cluster, add = TRUE)
plot(swi_cropped[[1]])
plot(cluster, add = TRUE)




# extract raster values: 4 chosen points each one

ndvi_values <- extract(ndvi_cropped, cluster, 
                          method = "simple", df = TRUE)
# winter
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


swi_values <- extract(swi_cropped, cluster, 
                          method = "simple", df = TRUE)
# winter
swi2015_values <- extract(swi_cropped[[1]], cluster, 
                          method = "simple", df = TRUE)
swi2016_values <- extract(swi_cropped[[3]], cluster, 
                          method = "simple", df = TRUE)
swi2017_values <- extract(swi_cropped[[5]], cluster, 
                          method = "simple", df = TRUE)
swi2018_values <- extract(swi_cropped[[7]], cluster, 
                          method = "simple", df = TRUE)
swi2019_values <- extract(swi_cropped[[9]], cluster, 
                          method = "simple", df = TRUE)
swi2020_values <- extract(swi_cropped[[11]], cluster, 
                          method = "simple", df = TRUE)


# give names to the values of bosco ficuzza (the first of four)


ndvi2015 <- 0.59600002 # vegetation index bosco ficuzza winter 2015
ndvi2016 <- 0.93200004 # vegetation index bosco ficuzza winter 2016
ndvi2017 <- 0.9280000  # vegetation index bosco ficuzza winter 2017
ndvi2018 <- 0.9280000  # vegetation index bosco ficuzza winter 2018
ndvi2019 <- 0.9280000  # vegetation index bosco ficuzza winter 2019
ndvi2020 <- 0.65200001 # vegetation index bosco ficuzza winter 2020

swi2015 <-             # soil moisture index bosco ficuzza winter 2015


# single graphs
ndvi <- c(0.59600002, 0.93200004, 0.9280000, 0.9280000, 0.9280000, 0.65200001)
plot(ndvi, type = "o", col = "dark green")
title(main = "Vegetation of Bosco Ficuzza", col.main="black", font.main=4)

swi <-


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
lines( , type="o", pch=22, lty=2, col="blue")


# create a title 
title(main="Bosco Ficuzza", col.main="black", font.main=4)

# label the x and y axes 
title(xlab="Years")
title(ylab="Values")

# create a legend at (1, g_range[2]) that is slightly smaller (cex) 
legend("topright", g_range[2], c("Normalized Difference Vegetation",""), cex=0.9, 
   col=c("dark green","blue"), pch=21:22, lty=1:2)



# scatterplot bosco ficuzza
# is there a correlation between ndvi and swi?
x <- 
y <- 

# plot with main and axis titles
plot(x, y, main = "Correlation (Bosco Ficuzza)",
     xlab = "", ylab = "",
     pch = 19, col = "brown")


















