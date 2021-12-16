# R code for uploading and visualizing Copernicus data in Rlibrary(ncdf4)
library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)

# set the working directory
setwd("C:/lab//copernicus/") 

# raster
leaf01052020 <- raster("c_gls_LAI-RT0_202006300000_GLOBE_PROBAV_V2.0.1.nc")
leaf01052020

# plot the data
plot(leaf01052020)

cl <- colorRampPalette(c('light green','green','dark green'))(100) #
plot(leaf01052020, col=cl)

# viridis
install.packages("viridis")
library(viridis)

ggplot() + geom_raster(leaf01052020, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km))
# viridis
ggplot() + geom_raster(leaf01052020, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km)) 
+ scale_fill_viridis() +  ggtitle("viridis palette")
# cividis
ggplot() + geom_raster(leaf01052020, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km)) 
+ scale_fill_viridis(option = "cividis") +  ggtitle("cividis palette")


