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


library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)
library(patchwork)
library(gridExtra)

setwd("C:/lab//copernicus/") 

######### 2020 veg
# raster jen
veg20200101 <- raster("c_gls_NDVI300_202001010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200101
plot(veg20200101)

# raster jul
veg20200701 <- raster("c_gls_NDVI300_202007010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200701
plot(veg20200701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg6_cropped <- crop(veg20200101, ext)
plot(veg6_cropped <- crop(veg20200101, ext))
# plot(veg6_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg6b_cropped <- crop(veg20200701, ext)
plot(veg6b_cropped <- crop(veg20200701, ext))


######### 2019 veg
# raster jen
veg20190101 <- raster("c_gls_NDVI300_201901010000_GLOBE_PROBAV_V1.0.1.nc")
veg20190101
plot(veg20190101)

# raster jul
veg20190701 <- raster("c_gls_NDVI300_201907010000_GLOBE_PROBAV_V1.0.1.nc")
veg20190701
plot(veg20190701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg5_cropped <- crop(veg20190101, ext)
plot(veg5_cropped <- crop(veg20190101, ext))
# plot(veg5_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg5b_cropped <- crop(veg20190701, ext)
plot(veg5b_cropped <- crop(veg20190701, ext))


######### 2018 veg
# raster jen
veg20180101 <- raster("c_gls_NDVI300_201801010000_GLOBE_PROBAV_V1.0.1.nc")
veg20180101
plot(veg20180101)

# raster jul
veg20180701 <- raster("c_gls_NDVI300_201807010000_GLOBE_PROBAV_V1.0.1.nc")
veg20180701
plot(veg20180701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg4_cropped <- crop(veg20180101, ext)
plot(veg4_cropped <- crop(veg20180101, ext))
# plot(veg4_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg4b_cropped <- crop(veg20180701, ext)
plot(veg4b_cropped <- crop(veg20180701, ext))


######### 2017 veg
# raster jen
veg20170101 <- raster("c_gls_NDVI300_201701010000_GLOBE_PROBAV_V1.0.1.nc")
veg20170101
plot(veg20170101)

# raster jul
veg20170701 <- raster("c_gls_NDVI300_201707010000_GLOBE_PROBAV_V1.0.1.nc")
veg20170701
plot(veg20170701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg3_cropped <- crop(veg20170101, ext)
plot(veg3_cropped <- crop(veg20170101, ext))
# plot(veg3_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg3b_cropped <- crop(veg20170701, ext)
plot(veg3b_cropped <- crop(veg20170701, ext))


######### 2016 veg
# raster jen
veg20160101 <- raster("c_gls_NDVI300_201601010000_GLOBE_PROBAV_V1.0.1.nc")
veg20160101
plot(veg20160101)

# raster jul
veg20160701 <- raster("c_gls_NDVI300_201607010000_GLOBE_PROBAV_V1.0.1.nc")
veg20160701
plot(veg20160701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2_cropped <- crop(veg20160101, ext)
plot(veg2_cropped <- crop(veg20160101, ext))
# plot(veg2_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2b_cropped <- crop(veg20160701, ext)
plot(veg2b_cropped <- crop(veg20160701, ext))


######### 2015 veg
# raster jen
veg20150101 <- raster("c_gls_NDVI300_201501010000_GLOBE_PROBAV_V1.0.1.nc")
veg20150101
plot(veg20150101)

#raster jul
veg20150701 <- raster("c_gls_NDVI300_201507010000_GLOBE_PROBAV_V1.0.1.nc")
veg20150701
plot(veg20150701)

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1_cropped <- crop(veg20150101, ext)
plot(veg1_cropped <- crop(veg20150101, ext))
# plot(veg1_cropped, col=cl)

# crop jul
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg1b_cropped <- crop(veg20150701, ext)
plot(veg1b_cropped <- crop(veg20150701, ext))


vegwin <- stack(veg1_cropped, veg2_cropped, veg3_cropped, veg4_cropped, veg5_cropped, veg6_cropped)
plot(vegwin)

vegsum <- stack((veg1b_cropped, veg2b_cropped, veg3b_cropped, veg4b_cropped, veg5b_cropped, veg6b_cropped)
plot(vegsum)

                
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
 
# first half   
par(mfrow=c(3,2))
plot(veg1_cropped, main="winter_2015")
plot(veg1b_cropped, main="summer_2015")
plot(veg2_cropped, main="winter_2016")
plot(veg2b_cropped, main="summer_2016")
plot(veg3_cropped, main="winter_2017")
plot(veg3b_cropped, main="summer_2017")
                
# second half                              
par(mfrow=c(3,2))              
plot(veg4_cropped, main="winter_2018")
plot(veg4b_cropped, main="summer_2018")
plot(veg5_cropped, main="winter_2019")
plot(veg5b_cropped, main="summer_2019")
plot(veg6_cropped, main="winter_2020")
plot(veg6b_cropped, main="summer_2020")                

             
             


ggplot(veg, aes(x=longitude, y=latitude, color=cover)) + geom_bar(stat="identity", fill="white")



######### 2020 alb
# raster jen
alb20200124 <- raster("c_gls_ALDH_202001240000_GLOBE_PROBAV_V1.5.1.nc")
alb20200124
plot(alb20200124)
                
# raster jun
alb20200613 <- raster("c_gls_ALDH_202006130000_GLOBE_PROBAV_V1.5.1.nc")
alb20200613
plot(alb20200613)                

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb6_cropped <- crop(alb20200124, ext)
plot(alb6_cropped <- crop(alb20200124, ext))

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb6b_cropped <- crop(alb20200613, ext)
plot(alb6b_cropped <- crop(alb20200613, ext))
                
                
######### 2019 alb
# raster jen
alb20190124 <- raster("c_gls_ALDH_201901240000_GLOBE_PROBAV_V1.5.1.nc")
alb20190124
plot(alb20190124)
                
# raster jun
alb20190623 <- raster("c_gls_ALDH_201906230000_GLOBE_PROBAV_V1.5.1.nc")
alb20190623
plot(alb20190623)
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb5_cropped <- crop(alb20190124, ext)
plot(alb5_cropped <- crop(alb20190124, ext))

# crop jun
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb5b_cropped <- crop(alb20190623, ext)
plot(alb5b_cropped <- crop(alb20190623, ext))
                

######### 2018 alb
# raster jen
alb20180124 <- raster("c_gls_ALDH_201801240000_GLOBE_PROBAV_V1.5.1.nc")
alb20180124
plot(alb20180124)

# raster jul
                

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb4_cropped <- crop(alb20180124, ext)
plot(alb4_cropped <- crop(alb20180124, ext))

# crop jul
                

######### 2017 alb
# raster jen
alb20170124 <- raster("c_gls_ALDH_201701240000_GLOBE_PROBAV_V1.5.1.nc")
alb20170124
plot(alb20170124)
                
# raster jul
                

# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb3_cropped <- crop(alb20170124, ext)
plot(alb3_cropped <- crop(alb20170124, ext))
                
# crop jul
                


######### 2016 alb
# raster jen
alb20160124 <- raster("c_gls_ALDH_201601240000_GLOBE_PROBAV_V1.5.1.nc")
alb20160124
plot(alb20160124)

# raster jul
                
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb2_cropped <- crop(alb20160124, ext)
plot(alb2_cropped <- crop(alb20160124, ext))

# crop jul
                

######### 2015 alb
# raster jen
alb20150124 <- raster("c_gls_ALDH_201501240000_GLOBE_PROBAV_V1.5.1.nc")
alb20150124
plot(alb20150124)
                
# raster jul
                
                
# crop jen
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb1_cropped <- crop(alb20150124, ext)
plot(alb1_cropped <- crop(alb20150124, ext))

                
# crop jul                


albwin <- stack(alb1_cropped, alb2_cropped, alb3_cropped, alb4_cropped, alb5_cropped, alb6_cropped)
plot(albwin)
                
albsum <- stack(alb1b_cropped, alb2b_cropped, alb3b_cropped, alb4b_cropped, alb5b_cropped, alb6b_cropped)              
albsum
                

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


# first half
par(mfrow=c(3,2))
plot(alb1_cropped, main="winter_2015")
plot(alb1b_cropped, main="summer_2015")
plot(alb2_cropped, main="winter_2016")
plot(alb2b_cropped, main="summer_2016")
plot(alb3_cropped, main="winter_2017") 
plot(alb3b_cropped, main="summer_2017")
               
                
# second half
par(mfrow=c(3,2))
plot(alb4_cropped, main="winter_2018")
plot(alb4b_cropped, main="summer_2018")
plot(alb5_cropped, main="winter_2019")
plot(alb5b_cropped, main="summer_2019")
plot(alb6_cropped, main="winter_2020")
plot(alb6b_cropped, main="summer_2020")                

















