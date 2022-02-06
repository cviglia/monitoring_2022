# my project

# The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes, a proxy to quantify the vegetation amount.

# Even though it is not a physical property of the vegetation cover, it has a very simple formulation NDVI = (REF_nir – REF_red)/(REF_nir + REF_red) 
# where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, thqt makes it widely used for ecosystems monitoring.

# The NDVI is widely used by the bio-geophysical community to monitor the vegetation state and disturbances to address a large range of applications, 
# including forestry, agriculture, food security, water management.

# Very low values of NDVI (0.1 and below) correspond to barren areas of rock, sand, or snow. Moderate values represent shrub and grassland (0.2 to 0.3), 
# while high values indicate temperate and tropical rainforests (0.6 to 0.8).

# The surface albedo quantifies the fraction of the sunlight reflected by the surface of the Earth. Different albedo concepts are defined
# and we will focus on the directional albedo or directional-hemispherical reflectance. It is also called black-sky albedo and it is the integration of
# the bi-directional reflectance over the viewing hemisphere. It assumes all energy is coming from a direct radiation from the sun and is computed for a specific time.

# The Global Climate Observing System (GCOS) specified the black-sky albedo as an Essential Climate Variable and the product is required for climate change purposes.

# Albedo is a key forcing parameter controlling the planetary radiative energy budget and the partitioning of radiative energy between the atmosphere and surface. 

# The energy absorbed at the surface is used to drive vegetation processes such as evapotranspiration, photosynthesis and carbon assimilation, 
# and govern temperature-related processes such as evaporation, and snow melt. 

# Thus albedo varies in space and time as a result of both natural processes (e.g. changes in solar position, inundation and vegetation growth) 
# and human activities (e.g. clearing and planting forests, sowing and harvesting crops, burning rangeland). It is a sensitive indicator of environmental vulnerability. 

# bosco ficuzza long lat (13.40100, 37.91054)
# parco dell'etna long lat (14.9910188438527,37.7484444540323)
# parco delle madonie long lat (14.02685,37.86626)
# riserva cavagrande long lat (15.0969771982218,36.9768781858837)

# libraries
pacman::p_load(sp, rgdal, raster, rgeos, rasterVis, 
               RStoolbox, dplyr, writexl, ggplot2)

setwd("C:/lab//my/") 

# create raster objects from files, import the rasters
# crop: coordinates of Sicily (longitude 11.9256 - 15.6528; latitude 35.4929 - 38.8122)

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
plot(vegwin)

vegsum <- stack(veg1b_cropped, veg2b_cropped, veg3b_cropped, veg4b_cropped, veg5b_cropped, veg6b_cropped)
plot(vegsum)
              

albwin <- stack(alb1_cropped, alb2_cropped, alb3_cropped, alb4_cropped, alb5_cropped, alb6_cropped)
plot(albwin)
                
albsum <- stack(alb1b_cropped, alb2b_cropped, alb3b_cropped, alb4b_cropped, alb5b_cropped, alb6b_cropped)              
plot(albsum)
        


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


# import spatialpoints
cluster <- read.csv(file = "Points_ext.csv", stringsAsFactors=FALSE)
coordinates(cluster) <- ~Longitude+Latitude
crs_wgs84 <- CRS(SRS_string = "EPSG:4326")
slot(cluster, "proj4string") <- crs_wgs84
plot(cluster)

# plot Albedo and NDVI, add points
par(mfrow=c(1,2))
plot(alb1_cropped)
plot(cluster, add = TRUE)
plot(veg1_cropped)
plot(cluster, add = TRUE)


# extract raster values
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

# give names to the values of bosco ficuzza (the first observations of the raster values)
vegvalue1 <- 0.59600002 # vegetation index bosco ficuzza jen 2015
vegvalue2 <- 0.93200004 # vegetation index bosco ficuzza jen 2016
vegvalue3 <- 0.9280000  # vegetation index bosco ficuzza jen 2017
vegvalue4 <- 0.9280000  # vegetation index bosco ficuzza jen 2018
vegvalue5 <- 0.9280000  # vegetation index bosco ficuzza jen 2019
vegvalue6 <- 0.65200001 # vegetation index bosco ficuzza jen 2020

NDVI_win <- c(0.59600002, 0.93200004, 0.9280000, 0.9280000, 0.9280000, 0.65200001)
plot(NDVI_win, type = "o", col = "green")
title(main = "Vegetation of Bosco Ficuzza in winter", col.main="black", font.main=4)


albvalue1 <- 0.1196 # albedo bosco ficuzza jen 2015
albvalue2 <- 0.1055 # albedo bosco ficuzza jen 2016
albvalue3 <- 0.1029 # albedo bosco ficuzza jen 2017
albvalue4 <- 0.1169 # albedo bosco ficuzza jen 2018
albvalue5 <- 0.1210 # albedo bosco ficuzza jen 2019
albvalue6 <- 0.1208  # albedo bosco ficuzza jen 2020

ALDH_win <- c(0.1196, 0.1055, 0.1029, 0.1169, 0.1210, 0.1208)
plot(ALDH_win, type = "o", col = "red")
title(main = "Albedo of Bosco Ficuzza in winter", col.main="black", font.main=4)







