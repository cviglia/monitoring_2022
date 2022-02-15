# useful but not now

# parco dell'etna long lat (14.9910188438527,37.7484444540323)
# parco delle madonie long lat (14.02685,37.86626)
# riserva cavagrande long lat (15.0969771982218,36.9768781858837)

# Require libraries
pacman::p_load(sf, sp, rgdal, raster, rgeos, rasterVis, 
               RStoolbox, dplyr, writexl, ggplot2,      
               
# Create a working directory
wd <- ("~/Downloads/Test/Test_Costanza/")

#################### NDVI Calculation
# First create list of files with similar pattern by using "list.files()" 
# function
# In this case similar pattern can be "20180827" as it is used for each band
# "list.files()" produce a character vector of the names of files or directories 
# in the named directory
rlist_20180827 <- list.files(path = wd, 
                             pattern = "20180827", 
                             full.names = TRUE)

# Check the list
rlist_20180827

# Use "lapply()" function over a list of vector to import them
import <- lapply(rlist_20180827, raster)
import

# Create a stack of the rasters for NDVI analysis by using "stack()" function
# This function creates 1 layer raster from several
rstack_20180827 <- stack(import)
plotRGB(rstack_20180827, 3, 2, 1, stretch = "lin")

# Calculate NDVI using "spectralindices()" function
NDVI_20180827 <- spectralIndices(rstack_20180827, 
                                 red = 3, nir = 4,
                                 indices = "NDVI")
plot(NDVI_20180827)


# Extract NDVI values for each point by using the spatial points data frame
NDVI_20180827 <- extract(NDVI_20180827, cluster, 
                             method = "simple", df = TRUE)
# Save NDVI raster as a .tif file
writeRaster(NDVI_20180827, "~/Downloads/Test/Test_Costanza/NDVI_test.tif")

# The Leaf Area Index (LAI) is defined as half the total area of green elements of the canopy per unit horizontal ground area. 
# The satellite-derived value corresponds to the total green LAI of all the canopy layers, including the understory which may represent a very significant contribution, 
# particularly for forests. Practically, the LAI quantifies the thickness of the vegetation cover.
# LAI is recognized as an Essential Climate Variable (ECV) by the Global Climate Observing System (GCOS).

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
listssm <- list.files(pattern = "SSM")
# apply a function to a list: import single layers images
importssm <- lapply(listssm, raster) 
# put all the images together
stackssm <- stack(importssm) 
# crop the stack: coordinates of Sicily
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
ssm_cropped <- crop(stackssm, ext)


# plot NDVI and SSM, add points
par(mfrow=c(1,2))
plot(ndvi_cropped[[1]])
plot(cluster, add = TRUE)
plot(ssm_cropped[[1]])
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


ssm_values <- extract(ssm_cropped, cluster, 
                          method = "simple", df = TRUE)
# winter
ssm2015_values <- extract(ssm_cropped[[1]], cluster, 
                          method = "simple", df = TRUE)
ssm2016_values <- extract(ssm_cropped[[3]], cluster, 
                          method = "simple", df = TRUE)
ssm2017_values <- extract(ssm_cropped[[5]], cluster, 
                          method = "simple", df = TRUE)
ssm2018_values <- extract(ssm_cropped[[7]], cluster, 
                          method = "simple", df = TRUE)
ssm2019_values <- extract(ssm_cropped[[9]], cluster,
                          method = "simple", df = TRUE)
ssm2020_values <- extract(ssm_cropped[[11]], cluster, 
                          method = "simple", df = TRUE)




# give names to the values of bosco ficuzza (the first of four)


ndvi2015 <- 0.59600002 # vegetation index bosco ficuzza winter 2015
ndvi2016 <- 0.93200004 # vegetation index bosco ficuzza winter 2016
ndvi2017 <- 0.9280000  # vegetation index bosco ficuzza winter 2017
ndvi2018 <- 0.9280000  # vegetation index bosco ficuzza winter 2018
ndvi2019 <- 0.9280000  # vegetation index bosco ficuzza winter 2019
ndvi2020 <- 0.65200001 # vegetation index bosco ficuzza winter 2020

swi2015 <-             # soil moisture index bosco ficuzza winter 2015





aldh <- c(0.1196, 0.1055, 0.1029, 0.1169, 0.1210, 0.1208)
plot(aldh, type = "o", col = "dark red")
title(main = "Albedo of Bosco Ficuzza", col.main="black", font.main=4)

lai <- c(1.666650, 3.333300, 1.899981, 1.733316, 1.966647, 1.899981)
plot(lai, type = "o", col = "orange")
title(main = "Leaf Area of Bosco Ficuzza", col.main="black", font.main=4)





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


########################################################################################################



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



# plot ALDH, LAI
par(mfrow=c(1,2))
plot(aldh_cropped[[1]])
plot(cluster, add = TRUE)
plot(lai_cropped[[1]])
plot(cluster, add = TRUE)




# values
aldh_values <- extract(aldh_cropped, cluster,
                       method = "simple", df = TRUE)
# winter

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



aldh1 <- 0.1196 # albedo bosco ficuzza winter 2015
aldh2 <- 0.1055 # albedo bosco ficuzza winter 2016
aldh3 <- 0.1029 # albedo bosco ficuzza winter 2017
aldh4 <- 0.1169 # albedo bosco ficuzza winter 2018
aldh5 <- 0.1210 # albedo bosco ficuzza winter 2019
aldh6 <- 0.1208 # albedo bosco ficuzza winter 2020



lai1 <- 1.666650 # leaf area bosco ficuzza 2015
lai2 <- 3.333300 # leaf area bosco ficuzza 2016
lai3 <- 1.899981 # leaf area bosco ficuzza 2017
lai4 <- 1.733316 # leaf area bosco ficuzza 2018
lai5 <- 1.966647 # leaf area bosco ficuzza 2019
lai6 <- 1.899981 # leaf area bosco ficuzza 2020


################################################################### in alternative, long way

# create raster objects from files, import the rasters
# crop: coordinates of Sicily

######### 2020 veg
# raster jen
veg20200101 <- raster("c_gls_NDVI300_202001010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200101
# plot(veg20200101)

# raster jul
veg20200701 <- raster("c_gls_NDVI300_202007010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200701
# plot(veg20200701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg6_cropped <- crop(veg20200101, ext)
veg6_cropped
# plot(veg6_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg6b_cropped <- crop(veg20200701, ext)
veg6b_cropped
# plot(veg6b_cropped)

######### 2020 alb
# raster jen
alb20200124 <- raster("c_gls_ALDH_202001240000_GLOBE_PROBAV_V1.5.1.nc")
alb20200124
# plot(alb20200124)
                
# raster jun
alb20200613 <- raster("c_gls_ALDH_202006130000_GLOBE_PROBAV_V1.5.1.nc")
alb20200613
# plot(alb20200613)                

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb6_cropped <- crop(alb20200124, ext)
alb6_cropped
# plot(alb6_cropped)

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb6b_cropped <- crop(alb20200613, ext)
alb6b_cropped
# plot(alb6b_cropped)


######### 2019 veg
# raster jen
veg20190101 <- raster("c_gls_NDVI300_201901010000_GLOBE_PROBAV_V1.0.1.nc")
veg20190101
# plot(veg20190101)

# raster jul
veg20190701 <- raster("c_gls_NDVI300_201907010000_GLOBE_PROBAV_V1.0.1.nc")
veg20190701
# plot(veg20190701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg5_cropped <- crop(veg20190101, ext)
veg5_cropped
# plot(veg5_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg5b_cropped <- crop(veg20190701, ext)
veg5b_cropped
# plot(veg5b_cropped)

######### 2019 alb
# raster jen
alb20190124 <- raster("c_gls_ALDH_201901240000_GLOBE_PROBAV_V1.5.1.nc")
alb20190124
# plot(alb20190124)
                
# raster jun
alb20190623 <- raster("c_gls_ALDH_201906230000_GLOBE_PROBAV_V1.5.1.nc")
alb20190623
# plot(alb20190623)
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb5_cropped <- crop(alb20190124, ext)
alb5_cropped
# plot(alb5_cropped)

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb5b_cropped <- crop(alb20190623, ext)
alb5b_cropped
# plot(alb5b_cropped)
                

######### 2018 veg
# raster jen
veg20180101 <- raster("c_gls_NDVI300_201801010000_GLOBE_PROBAV_V1.0.1.nc")
veg20180101
# plot(veg20180101)

# raster jul
veg20180701 <- raster("c_gls_NDVI300_201807010000_GLOBE_PROBAV_V1.0.1.nc")
veg20180701
# plot(veg20180701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg4_cropped <- crop(veg20180101, ext)
veg4_cropped
# plot(veg4_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg4b_cropped <- crop(veg20180701, ext)
veg4b_cropped
# plot(veg4b_cropped)

######### 2018 alb
# raster jen
alb20180124 <- raster("c_gls_ALDH_201801240000_GLOBE_PROBAV_V1.5.1.nc")
alb20180124
# plot(alb20180124)

# raster jun
alb20180623 <- raster("c_gls_ALDH_201806230000_GLOBE_PROBAV_V1.5.1.nc")
alb20180623
# plot(alb20180623)               

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb4_cropped <- crop(alb20180124, ext)
alb4_cropped
# plot(alb4_cropped)

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb4b_cropped <- crop(alb20180623, ext)  
alb4b_cropped
# plot(alb4b_cropped)               


######### 2017 veg
# raster jen
veg20170101 <- raster("c_gls_NDVI300_201701010000_GLOBE_PROBAV_V1.0.1.nc")
veg20170101
# plot(veg20170101)

# raster jul
veg20170701 <- raster("c_gls_NDVI300_201707010000_GLOBE_PROBAV_V1.0.1.nc")
veg20170701
# plot(veg20170701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg3_cropped <- crop(veg20170101, ext)
veg3_cropped
# plot(veg3_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg3b_cropped <- crop(veg20170701, ext)
veg3b_cropped
# plot(veg3b_cropped)

######### 2017 alb
# raster jen
alb20170124 <- raster("c_gls_ALDH_201701240000_GLOBE_PROBAV_V1.5.1.nc")
alb20170124
# plot(alb20170124)
                
# raster jun
alb20170623<- raster("c_gls_ALDH_201706230000_GLOBE_PROBAV_V1.5.1.nc")
alb20170623                
# plot(alb20170623)
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb3_cropped <- crop(alb20170124, ext)
alb3_cropped
# plot(alb3_cropped)
                
# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb3b_cropped <- crop(alb20170623, ext)
alb3b_cropped
# plot(alb3b_cropped)               


######### 2016 veg
# raster jen
veg20160101 <- raster("c_gls_NDVI300_201601010000_GLOBE_PROBAV_V1.0.1.nc")
veg20160101
# plot(veg20160101)

# raster jul
veg20160701 <- raster("c_gls_NDVI300_201607010000_GLOBE_PROBAV_V1.0.1.nc")
veg20160701
# plot(veg20160701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2_cropped <- crop(veg20160101, ext)
veg2_cropped
# plot(veg2_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2b_cropped <- crop(veg20160701, ext)
veg2b_cropped
# plot(veg2b_cropped)

######### 2016 alb
# raster jen
alb20160124 <- raster("c_gls_ALDH_201601240000_GLOBE_PROBAV_V1.5.1.nc")
alb20160124
# plot(alb20160124)

# raster jun
alb20160623 <- raster("c_gls_ALDH_201606230000_GLOBE_PROBAV_V1.5.1.nc")            
alb20160623
# plot(alb20160623)
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb2_cropped <- crop(alb20160124, ext)
alb2_cropped
# plot(alb2_cropped)

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb2b_cropped <- crop(alb20160623, ext)
alb2b_cropped
# plot(alb2b_cropped)
                

######### 2015 veg
# raster jen
veg20150101 <- raster("c_gls_NDVI300_201501010000_GLOBE_PROBAV_V1.0.1.nc")
veg20150101
# plot(veg20150101)

#raster jul
veg20150701 <- raster("c_gls_NDVI300_201507010000_GLOBE_PROBAV_V1.0.1.nc")
veg20150701
# plot(veg20150701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1_cropped <- crop(veg20150101, ext)
veg1_cropped
# plot(veg1_cropped)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1b_cropped <- crop(veg20150701, ext)
veg1b_cropped
# plot(veg1b_cropped)

######### 2015 alb
# raster jen
alb20150124 <- raster("c_gls_ALDH_201501240000_GLOBE_PROBAV_V1.5.1.nc")
alb20150124
# plot(alb20150124)
                
# raster jun
alb20150623 <- raster("c_gls_ALDH_201506230000_GLOBE_PROBAV_V1.5.1.nc")
alb20150623               
# plot(alb20150623)                
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb1_cropped <- crop(alb20150124, ext)
alb1_cropped
# plot(alb1_cropped)
               
# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb1b_cropped <- crop(alb20150623, ext)           
alb1b_cropped
# plot(alb1b_cropped)


# create stacks to concatenates multiple vectors into a single vector 
vegwin <- stack(veg1_cropped, veg2_cropped, veg3_cropped, veg4_cropped, veg5_cropped, veg6_cropped)
# plot(vegwin)

vegsum <- stack(veg1b_cropped, veg2b_cropped, veg3b_cropped, veg4b_cropped, veg5b_cropped, veg6b_cropped)
# plot(vegsum)
              

albwin <- stack(alb1_cropped, alb2_cropped, alb3_cropped, alb4_cropped, alb5_cropped, alb6_cropped)
# plot(albwin)
                
albsum <- stack(alb1b_cropped, alb2b_cropped, alb3b_cropped, alb4b_cropped, alb5b_cropped, alb6b_cropped)              
# plot(albsum)
        

# all 
# create a pdf with everything # pdf() # dev.off()
# create single images: jpeg singles multi-paneled plottings  # jpeg() # dev.off()

# pdf()
par(mfrow=c(2,2))
plot(alb1_cropped, main="albedo_winter_2015")
plot(veg1_cropped, main="vegetation_winter_2015")
plot(alb1b_cropped, main="albedo_summer_2015")
plot(veg1b_cropped, main="vegetation_summer_2015")

par(mfrow=c(2,2))
plot(alb2_cropped, main="albedo_winter_2016")
plot(veg2_cropped, main="vegetation_winter_2016")
plot(alb2b_cropped, main="albedo_summer_2016")
plot(veg2b_cropped, main="vegetation_summer_2016")

par(mfrow=c(2,2))
plot(alb3_cropped, main="albedo_winter_2017")
plot(veg3_cropped, main="vegetation_winter_2017")
plot(alb3b_cropped, main="albedo_summer_2017")
plot(veg3b_cropped, main="vegetation_summer_2017")

par(mfrow=c(2,2))
plot(alb4_cropped, main="albedo_winter_2018")
plot(veg4_cropped, main="vegetation_winter_2018")
plot(alb4b_cropped, main="albedo_summer_2018")
plot(veg4b_cropped, main="vegetation_summer_2018")

par(mfrow=c(2,2))
plot(alb5_cropped, main="albedo_winter_2019")
plot(veg5_cropped, main="vegetation_winter_2019")
plot(alb5b_cropped, main="albedo_summer_2019")
plot(veg5b_cropped, main="vegetation_summer_2019")
dev.off()

par(mfrow=c(2,2))
plot(alb6_cropped, main="albedo_winter_2020")
plot(veg6_cropped, main="vegetation_winter_2020")
plot(alb6b_cropped, main="albedo_summer_2020")          
plot(veg6b_cropped, main="vegetation_summer_2020")
# dev.off()

# graph
# extract raster values of winter
alb1_cropped_values <- extract(alb1_cropped, cluster, 
                          method = "simple", df = TRUE)
veg1_cropped_values <- extract(veg1_cropped, cluster, 
                          method = "simple", df = TRUE)

alb2_cropped_values <- extract(alb2_cropped, cluster, 
                          method = "simple", df = TRUE)
veg2_cropped_values <- extract(veg2_cropped, cluster, 
                               method = "simple", df = TRUE)

alb3_cropped_values <- extract(alb3_cropped, cluster,
                               method = "simple", df = TRUE)
veg3_cropped_values <- extract(veg3_cropped, cluster, 
                               method = "simple", df = TRUE)

alb4_cropped_values <- extract(alb4_cropped, cluster,
                               method = "simple", df = TRUE)
veg4_cropped_values <- extract(veg4_cropped, cluster, 
                               method = "simple", df = TRUE)

alb5_cropped_values <- extract(alb5_cropped, cluster,
                               method = "simple", df = TRUE)
veg5_cropped_values <- extract(veg5_cropped, cluster, 
                               method = "simple", df = TRUE)

alb6_cropped_values <- extract(alb6_cropped, cluster,
                               method = "simple", df = TRUE)
veg6_cropped_values <- extract(veg6_cropped, cluster, 
                               method = "simple", df = TRUE)

# graph Bosco Ficuzza in winter
NDVI_win <- c(0.59600002, 0.93200004, 0.9280000, 0.9280000, 0.9280000, 0.65200001)
ALDH_win <- c(0.1196, 0.1055, 0.1029, 0.1169, 0.1210, 0.1208)


# graph Bosco Ficuzza in summer
NDVI_sum <- c(0.83600003, 0.78400004, 0.83600003, 0.87200004, 0.81600004, 0.84400004)
ALDH_sum <- c(0.1561, 0.1535, 0.1769, 0.1657, 0.2025, 0.1740)

# calculate range from 0 to max value 
g_range <- range(0, NDVI_sum, ALDH_sum)

# graph. Turn off axes and annotations (axis labels) 
plot(NDVI_sum, type="o", col="dark green", ylim=g_range, 
   axes=FALSE, ann=FALSE)

# make x axis using labels
axis(1, at=1:6, lab=c("2015","2016","2017","2018","2019", "2020"))

# make y axis with horizontal labels 
axis(2, las=1)

# create box around plot
box()

# graph albedo with red dashed line and square points
lines(ALDH_sum, type="o", pch=22, lty=2, col="dark red")

# title 
title(main="Bosco Ficuzza in summer", col.main="black", font.main=4)

# label the x and y axes 
title(xlab="Years")
title(ylab="Values")

# create a legend at (1, g_range[2]) that is slightly smaller (cex) 
legend("left", g_range[2], c("Vegetation","Albedo"), cex=0.9, 
   col=c("dark green","dark red"), pch=21:22, lty=1:2)



# give names to the values of bosco ficuzza in winter (the first observations of the raster values)

albvalue1 <- 0.1196 # albedo bosco ficuzza jen 2015
albvalue2 <- 0.1055 # albedo bosco ficuzza jen 2016
albvalue3 <- 0.1029 # albedo bosco ficuzza jen 2017
albvalue4 <- 0.1169 # albedo bosco ficuzza jen 2018
albvalue5 <- 0.1210 # albedo bosco ficuzza jen 2019
albvalue6 <- 0.1208 # albedo bosco ficuzza jen 2020

vegvalue1 <- 0.59600002 # vegetation index bosco ficuzza jen 2015
vegvalue2 <- 0.93200004 # vegetation index bosco ficuzza jen 2016
vegvalue3 <- 0.9280000  # vegetation index bosco ficuzza jen 2017
vegvalue4 <- 0.9280000  # vegetation index bosco ficuzza jen 2018
vegvalue5 <- 0.9280000  # vegetation index bosco ficuzza jen 2019
vegvalue6 <- 0.65200001 # vegetation index bosco ficuzza jen 2020


ALDH_win <- c(0.1196, 0.1055, 0.1029, 0.1169, 0.1210, 0.1208)
plot(ALDH_win, type = "o", col = "dark red")
title(main = "Albedo of Bosco Ficuzza in winter", col.main="black", font.main=4)

NDVI_win <- c(0.59600002, 0.93200004, 0.9280000, 0.9280000, 0.9280000, 0.65200001)
plot(NDVI_win, type = "o", col = "dark green")
title(main = "Vegetation of Bosco Ficuzza in winter", col.main="black", font.main=4)


# extract raster values of summer
alb1b_cropped_values <- extract(alb1b_cropped, cluster, 
                          method = "simple", df = TRUE)
veg1_cropped_values <- extract(veg1b_cropped, cluster, 
                          method = "simple", df = TRUE)

alb2b_cropped_values <- extract(alb2b_cropped, cluster, 
                          method = "simple", df = TRUE)
veg2b_cropped_values <- extract(veg2b_cropped, cluster, 
                               method = "simple", df = TRUE)

alb3b_cropped_values <- extract(alb3b_cropped, cluster,
                               method = "simple", df = TRUE)
veg3b_cropped_values <- extract(veg3b_cropped, cluster, 
                               method = "simple", df = TRUE)

alb4b_cropped_values <- extract(alb4b_cropped, cluster,
                               method = "simple", df = TRUE)
veg4b_cropped_values <- extract(veg4b_cropped, cluster, 
                               method = "simple", df = TRUE)

alb5b_cropped_values <- extract(alb5b_cropped, cluster,
                               method = "simple", df = TRUE)
veg5b_cropped_values <- extract(veg5b_cropped, cluster, 
                               method = "simple", df = TRUE)

alb6b_cropped_values <- extract(alb6b_cropped, cluster,
                               method = "simple", df = TRUE)
veg6b_cropped_values <- extract(veg6b_cropped, cluster, 
                               method = "simple", df = TRUE)


# give names to the values of bosco ficuzza in summer
vegvalue1b <- 0.83600003 # vegetation index bosco ficuzza jul 2015
vegvalue2b <- 0.78400004 # vegetation index bosco ficuzza jul 2016
vegvalue3b <- 0.83600003 # vegetation index bosco ficuzza jul 2017
vegvalue4b <- 0.87200004 # vegetation index bosco ficuzza jul 2018
vegvalue5b <- 0.81600004 # vegetation index bosco ficuzza jul 2019
vegvalue6b <- 0.84400004 # vegetation index bosco ficuzza jul 2020

albvalue1b <- 0.1561 # albedo bosco ficuzza jul 2015
albvalue2b <- 0.1535 # albedo bosco ficuzza jul 2016
albvalue3b <- 0.1769 # albedo bosco ficuzza jul 2017
albvalue4b <- 0.1657 # albedo bosco ficuzza jul 2018
albvalue5b <- 0.2025 # albedo bosco ficuzza jul 2019
albvalue6b <- 0.1740 # albedo bosco ficuzza jul 2020



######################################################## end of the long way




# create multi paneled plottings

# winter veg
par(mfrow=c(2,3))
plot(veg1_cropped, main="winter_2015")
plot(veg2_cropped, main="winter_2016")
plot(veg3_cropped, main="winter_2017")
plot(veg4_cropped, main="winter_2018")
plot(veg5_cropped, main="winter_2019")
plot(veg6_cropped, main="winter_2020")

# summer veg                
par(mfrow=c(2,3))
plot(veg1b_cropped, main="summer_2015")
plot(veg2b_cropped, main="summer_2016")
plot(veg3b_cropped, main="summer_2017")
plot(veg4b_cropped, main="summer_2018")
plot(veg5b_cropped, main="summer_2019")
plot(veg6b_cropped, main="summer_2020")                
 
# veg first half   
par(mfrow=c(3,2))
plot(veg1_cropped, main="winter_2015")
plot(veg1b_cropped, main="summer_2015")
plot(veg2_cropped, main="winter_2016")
plot(veg2b_cropped, main="summer_2016")
plot(veg3_cropped, main="winter_2017")
plot(veg3b_cropped, main="summer_2017")
                
# veg second half                              
par(mfrow=c(3,2))              
plot(veg4_cropped, main="winter_2018")
plot(veg4b_cropped, main="summer_2018")
plot(veg5_cropped, main="winter_2019")
plot(veg5b_cropped, main="summer_2019")
plot(veg6_cropped, main="winter_2020")
plot(veg6b_cropped, main="summer_2020")                

             


# winter alb
par(mfrow=c(2,3))
plot(alb1_cropped, main="winter_2015")
plot(alb2_cropped, main="winter_2016")
plot(alb3_cropped, main="winter_2017")
plot(alb4_cropped, main="winter_2018")
plot(alb5_cropped, main="winter_2019")
plot(alb6_cropped, main="winter_2020")


# summer alb
par(mfrow=c(2,3))
plot(alb1b_cropped, main="summer_2015")
plot(alb2b_cropped, main="summer_2016")
plot(alb3b_cropped, main="summer_2017")
plot(alb4b_cropped, main="summer_2018")
plot(alb5b_cropped, main="summer_2019")
plot(alb6b_cropped, main="summer_2020")                


# alb first half
par(mfrow=c(3,2))
plot(alb1_cropped, main="winter_2015")
plot(alb1b_cropped, main="summer_2015")
plot(alb2_cropped, main="winter_2016")
plot(alb2b_cropped, main="summer_2016")
plot(alb3_cropped, main="winter_2017") 
plot(alb3b_cropped, main="summer_2017")
               
                
# alb second half
par(mfrow=c(3,2))
plot(alb4_cropped, main="winter_2018")
plot(alb4b_cropped, main="summer_2018")
plot(alb5_cropped, main="winter_2019")
plot(alb5b_cropped, main="summer_2019")
plot(alb6_cropped, main="winter_2020")
plot(alb6b_cropped, main="summer_2020")                




### veg + alb
# winter
par(mfrow=c(3,2))
plot(veg1_cropped, main="vegetation_winter_2015")
plot(alb1_cropped, main="albedo_winter_2015")
plot(veg2_cropped, main="vegetation_winter_2016")
plot(alb2_cropped, main="albedo_winter_2016")
plot(veg3_cropped, main="vegetation_winter_2017")
plot(alb3_cropped, main="albedo_winter_2017")

par(mfrow=c(3,2))
plot(veg4_cropped, main="vegetation_winter_2018")
plot(alb4_cropped, main="albedo_winter_2018")
plot(veg5_cropped, main="vegetation_winter_2019")
plot(alb5_cropped, main="albedo_winter_2019")
plot(veg6_cropped, main="vegetation_winter_2020")
plot(alb6_cropped, main="albedo_winter_2020")

# summer
par(mfrow=c(3,2))
plot(veg1b_cropped, main="vegetation_summer_2015")
plot(alb1b_cropped, main="albedo_summer_2015")
plot(veg2b_cropped, main="vegetation_summer_2016")
plot(alb2b_cropped, main="albedo_summer_2016")
plot(veg3b_cropped, main="vegetation_summer_2017")
plot(alb3b_cropped, main="albedo_summer_2017")

par(mfrow=c(3,2))
plot(veg4b_cropped, main="vegetation_summer_2018")
plot(alb4b_cropped, main="albedo_summer_2018")
plot(veg5b_cropped, main="vegetation_summer_2019")
plot(alb5b_cropped, main="albedo_summer_2019")
plot(veg6b_cropped, main="vegetation_summer_2020")
plot(alb6b_cropped, main="albedo_summer_2020")                


#################################################################################


######### 2021 veg
# raster
veg20210101 <- raster("c_gls_NDVI300_202101010000_GLOBE_PROBAV_V1.0.1.nc")
veg20210101
plot(veg20210101)

#crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg8_cropped <- crop(veg20210101, ext)
plot(veg8_cropped <- crop(veg20210101, ext))
# plot(veg8_cropped, col=cl)

######### 2014 veg
# raster
veg20140101 <- raster("c_gls_NDVI300_201401010000_GLOBE_PROBAV_V1.0.1.nc")
veg20140101
plot(veg20140101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1_cropped <- crop(veg20140101, ext)
plot(veg1_cropped <- crop(veg20140101, ext))
# plot(veg1_cropped, col=cl)

######### 2014 alb
# raster
alb20140124 <- raster("c_gls_ALDH_201401240000_GLOBE_VGT_V1.4.1.nc")
alb20140124
plot(alb20140124)
# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb1_cropped <- crop(alb20140124, ext)
plot(alb1_cropped <- crop(alb20140124, ext))




# cividis
# ggplot() + geom_raster(veg8_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg8_cropped cividis")

# cividis
# ggplot() + geom_raster(veg7_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg7_cropped cividis")

# cividis
# ggplot() + geom_raster(veg6_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg6_cropped cividis")

# cividis
# ggplot() + geom_raster(veg5_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg5_cropped cividis")

# cividis
# ggplot() + geom_raster(veg4_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg4_cropped cividis")

# cividis
# ggplot() + geom_raster(veg3_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg3_cropped cividis")

# cividis
# ggplot() + geom_raster(veg2_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg2_cropped cividis")

# cividis
# ggplot() + geom_raster(veg1_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg1_cropped cividis")





##############################################
## lapply 
rlist <- list.files(pattern="NDVI")
rlist

list_rast <- lapply(rlist, raster)
list_rast


l2021 <- vegstack$Normalized.Difference.Vegetation.Index.333M.8
l2020 <- vegstack$Normalized.Difference.Vegetation.Index.333M.7
l2019 <- vegstack$Normalized.Difference.Vegetation.Index.333M.6
l2018 <- vegstack$Normalized.Difference.Vegetation.Index.333M.5
l2017 <- vegstack$Normalized.Difference.Vegetation.Index.333M.4
l2016 <- vegstack$Normalized.Difference.Vegetation.Index.333M.3
l2015 <- vegstack$Normalized.Difference.Vegetation.Index.333M.2
l2014 <- vegstack$Normalized.Difference.Vegetation.Index.333M.1


# crop!
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
l2021_cropped <- crop(l2021, ext)
l2020_cropped <- crop(l2020, ext)
l2019_cropped <- crop(l2019, ext)
l2018_cropped <- crop(l2018, ext)
l2017_cropped <- crop(l2017, ext)
l2016_cropped <- crop(l2016, ext)
l2015_cropped <- crop(l2015, ext)
l2014_cropped <- crop(l2014, ext)


plot(l2021_cropped)
plot(l2020_cropped)
plot(l2019_cropped)
plot(l2018_cropped)
plot(l2017_cropped)
plot(l2016_cropped)
plot(l2015_cropped)
plot(l2014_cropped)


p8 <- ggplot()+ geom_raster(l2021_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.8)) + scale_fill_viridis(option = "cividis") +  ggtitle("2021")
p7 <- ggplot()+ geom_raster(l2020_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.7)) + scale_fill_viridis(option = "cividis") +  ggtitle("2020")
p6 <- ggplot()+ geom_raster(l2019_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.6)) + scale_fill_viridis(option = "cividis") +  ggtitle("2019")
p5 <- ggplot()+ geom_raster(l2018_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.5)) + scale_fill_viridis(option = "cividis") +  ggtitle("2018")
p4 <- ggplot()+ geom_raster(l2017_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.4)) + scale_fill_viridis(option = "cividis") +  ggtitle("2017")
p3 <- ggplot()+ geom_raster(l2016_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.3)) + scale_fill_viridis(option = "cividis") +  ggtitle("2016")
p2 <- ggplot()+ geom_raster(l2015_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.2)) + scale_fill_viridis(option = "cividis") +  ggtitle("2015")
p1 <- ggplot()+ geom_raster(l2014_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.1)) + scale_fill_viridis(option = "cividis") +  ggtitle("2014")

assign("Vegetation_Amount", Normalized.Difference.Vegetation.Index.333M.8) 


grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, nrow = 4)

grid.arrange(
  p1,
  p2,
  p3,
  p4,
  p5,
  p6,
  p7,
  p8,
  nrow = 4,
  top = "Extension of Vegetation",
  bottom = textGrob(
    "",
    gp = gpar(fontface = 3, fontsize = 9),
    hjust = 1,
    x = 1
  )
)


p8 <- ggplot()+ geom_raster(l2021_cropped, mapping = aes(x = x, y = y, fill = )) + scale_fill_viridis(option = "cividis") +  ggtitle("2021")
p7 <- ggplot()+ geom_raster(l2020_cropped, mapping = aes(x = x, y = y, fill = )) + scale_fill_viridis(option = "cividis") +  ggtitle("2020")



# plot stacks, select point and automatically extract values
plot(vegwin[[1]])  # One exemplary layer for orientation
values_1 <- click(vegwin, n=1) 
# values_1 north-west 
# 2015/0.584, 2016/0.656, 2017/0.672, 2018/0.928, 2019/0.548, 2020/0.608

plot(vegwin[[1]])
values_2 <- click(vegwin, n=1)
# values_2 centre
# 2015/0.168, 2016/0.460, 2017/0.332, 2018/ 0.928, 2019/0.488, 2020/0.420

plot(vegwin[[1]])
values_3 <- click(vegwin, n=1)
# values_3 south-east
# 2015/0.568, 2016/0.640, 2017/0.608, 2018/ 0.656, 2019/0.684, 2020/0.624

plot(vegwin[[1]])
values_4 <- click(vegwin, n=1)
# values_4 north-east
# 2015/0.184, 2016/0.544, 2017/0.928, 2018/0.928, 2019/0.928, 2020/0.928





ID <-

# data.frame
NDVI_index <- data.frame(ID, Normalized.Difference.Vegetation.Index.333M)

# basic scatter plot with ggplot
ggplot(, aes(x=NDVI, y=ALDH)) + geom_point()
