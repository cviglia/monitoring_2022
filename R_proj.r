# my project

# The Normalized Difference Vegetation Index (NDVI) is an indicator of the greenness of the biomes, a proxy to quantify the vegetation amount.

# Even though it is not a physical property of the vegetation cover, its very simple formulation NDVI = (REF_nir – REF_red)/(REF_nir + REF_red) 
# where REF_nir and REF_red are the spectral reflectances measured in the near infrared and red wavebands respectively, makes it widely used for ecosystems monitoring.

# The NDVI is widely used by the bio-geophysical community to monitor the vegetation state and disturbances to address a large range of applications, 
# including forestry, agriculture, food security, water management.

# Very low values of NDVI (0.1 and below) correspond to barren areas of rock, sand, or snow. Moderate values represent shrub and grassland (0.2 to 0.3), 
# while high values indicate temperate and tropical rainforests (0.6 to 0.8).

# The surface albedo quantifies the fraction of the sunlight reflected by the surface of the Earth. Different albedo concepts are defined
# and we will focus on the directional albedo or directional-hemispherical reflectance. It is also called black-sky albedo and it is the integration of
# the bi-directional reflectance over the viewing hemisphere. It assumes all energy is coming from a direct radiation from the sun and is computed for a specific time.

# The Global Climate Observing System (GCOS) specified the black-sky albedo as an Essential Climate Variable and the product is required for climate change purposes.


library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)
library(patchwork)
library(gridExtra)

setwd("C:/lab//copernicus/") 

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


######### 2020 veg
# raster
veg20200101 <- raster("c_gls_NDVI300_202001010000_GLOBE_PROBAV_V1.0.1.nc")
veg20200101
plot(veg20200101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg7_cropped <- crop(veg20200101, ext)
plot(veg7_cropped <- crop(veg20200101, ext))
# plot(veg7_cropped, col=cl)


######### 2019 veg
# raster
veg20190101 <- raster("c_gls_NDVI300_201901010000_GLOBE_PROBAV_V1.0.1.nc")
veg20190101
plot(veg20190101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg6_cropped <- crop(veg20190101, ext)
plot(veg6_cropped <- crop(veg20190101, ext))
# plot(veg6_cropped, col=cl)


######### 2018 veg
# raster
veg20180101 <- raster("c_gls_NDVI300_201801010000_GLOBE_PROBAV_V1.0.1.nc")
veg20180101
plot(veg20180101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg5_cropped <- crop(veg20180101, ext)
plot(veg5_cropped <- crop(veg20180101, ext))
# plot(veg5_cropped, col=cl)


######### 2017 veg
# raster
veg20170101 <- raster("c_gls_NDVI300_201701010000_GLOBE_PROBAV_V1.0.1.nc")
veg20170101
plot(veg20170101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg4_cropped <- crop(veg20170101, ext)
plot(veg4_cropped <- crop(veg20170101, ext))
# plot(veg4_cropped, col=cl)


######### 2016 veg
# raster
veg20160101 <- raster("c_gls_NDVI300_201601010000_GLOBE_PROBAV_V1.0.1.nc")
veg20160101
plot(veg20160101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg3_cropped <- crop(veg20160101, ext)
plot(veg3_cropped <- crop(veg20160101, ext))
# plot(veg3_cropped, col=cl)


######### 2015 veg
# raster
veg20150101 <- raster("c_gls_NDVI300_201501010000_GLOBE_PROBAV_V1.0.1.nc")
veg20150101
plot(veg20150101)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
veg2_cropped <- crop(veg20150101, ext)
plot(veg2_cropped <- crop(veg20150101, ext))
# plot(veg2_cropped, col=cl)


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



veg <- stack(veg1_cropped, veg2_cropped, veg3_cropped, veg4_cropped, veg5_cropped, veg6_cropped, veg7_cropped, veg8_cropped)
plot(veg)


pdf()
par(mfrow=c(2,2))
plot(veg1_cropped, main="2014")
plot(veg2_cropped, main="2015")
plot(veg3_cropped, main="2016")
plot(veg4_cropped, main="2017")

par(mfrow=c(2,2))
plot(veg5_cropped, main="2018")
plot(veg6_cropped, main="2019")
plot(veg7_cropped, main="2020")
plot(veg8_cropped, main="2021")
dev.off()

par(mfrow=c(2,4))
plot(veg1_cropped, main="2014")
plot(veg2_cropped, main="2015")
plot(veg3_cropped, main="2016")
plot(veg4_cropped, main="2017")
plot(veg5_cropped, main="2018")
plot(veg6_cropped, main="2019")
plot(veg7_cropped, main="2020")
plot(veg8_cropped, main="2021")

legend(x, y,   # Coordinates (x also accepts keywords)
       legend, # Vector with the name of each group
       fill,   # Creates boxes in the legend with the specified colors
       col = par("col"), # Color of lines or symbols
       border = "black", # Fill box border color
       lty, lwd,         # Line type and width
       pch,              # Add pch symbols to legend lines or boxes
       bty = "o",        # Box type (bty = "n" removes the box)
       bg = par("bg")    # Background color of the legend
       box.lwd = par("lwd"), # Legend box line width
       box.lty = par("lty"), # Legend box line type
       box.col = par("fg"),  # Legend box line color
       cex = 1,          # Legend size
       horiz = FALSE     # Horizontal (TRUE) or vertical (FALSE) legend
       title = NULL      # Legend title
)


ggplot(veg, aes(x=longitude, y=latitude, color=cover)) + geom_bar(stat="identity", fill="white")



######### 2020 alb
# raster
alb20200124 <- raster("c_gls_ALDH_202001240000_GLOBE_PROBAV_V1.5.1.nc")
alb20200124
plot(alb20200124)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb7_cropped <- crop(alb20200124, ext)
plot(alb7_cropped <- crop(alb20200124, ext))


######### 2019 alb
# raster
alb20190124 <- raster("c_gls_ALDH_201901240000_GLOBE_PROBAV_V1.5.1.nc")
alb20190124
plot(alb20190124)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb6_cropped <- crop(alb20190124, ext)
plot(alb6_cropped <- crop(alb20190124, ext))


######### 2018 alb
# raster
alb20180124 <- raster("c_gls_ALDH_201801240000_GLOBE_PROBAV_V1.5.1.nc")
alb20180124
plot(alb20180124)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb5_cropped <- crop(alb20180124, ext)
plot(alb5_cropped <- crop(alb20180124, ext))


######### 2017 alb
# raster
alb20170124 <- raster("c_gls_ALDH_201701240000_GLOBE_PROBAV_V1.5.1.nc")
alb20170124
plot(alb20170124)

# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb4_cropped <- crop(alb20170124, ext)
plot(alb4_cropped <- crop(alb20170124, ext))


######### 2016 alb
# raster
alb20160124 <- raster("")
alb20160124
plot(alb20160124)
# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb3_cropped <- crop(alb20160124, ext)
plot(alb3_cropped <- crop(alb20160124, ext))


######### 2015 alb
# raster
alb20150124 <- raster("")
alb20150124
plot(alb20150124)
# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb2_cropped <- crop(alb20150124, ext)
plot(alb2_cropped <- crop(alb20150124, ext))


######### 2014 alb
# raster
alb20140124 <- raster("")
alb20140124
plot(alb20140124)
# crop
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
alb1_cropped <- crop(alb20140124, ext)
plot(alb1_cropped <- crop(alb20140124, ext))


alb <- stack(alb1_cropped, alb2_cropped, alb3_cropped, alb4_cropped, alb5_cropped, alb6_cropped, alb7_cropped)
plot(alb)

par(mfrow=c(2,4))
plot(alb1_cropped, main="2014")
plot(alb2_cropped, main="2015")
plot(alb3_cropped, main="2016")
plot(alb4_cropped, main="2017")
plot(alb5_cropped, main="2018")
plot(alb6_cropped, main="2019")
plot(alb7_cropped, main="2020")


pdf()
par(mfrow=c(2,2))
plot(alb1_cropped, main="2014")
plot(alb2_cropped, main="2015")
plot(alb3_cropped, main="2016")
plot(alb4_cropped, main="2017")

plot(alb5_cropped, main="2018")
plot(alb6_cropped, main="2019")
plot(alb7_cropped, main="2020")
dev.off()




















