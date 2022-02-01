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

# ..........................................................................................

library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)
library(RStoolbox)
library(patchwork)

# set the working directory
setwd("C:/lab//copernicus/") 

rlist <- list.files(pattern="LAI")
rlist

list_rast <- lapply(rlist, raster)
list_rast

leafstack <- stack(list_rast)
leafstack

ljune <- leafstack$Leaf.Area.Index.1km.1
lmay <- leafstack$Leaf.Area.Index.1km.2

# june
p1 <- ggplot()+ geom_raster(ljune, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km.1)) + scale_fill_viridis(option = "magma") +  ggtitle("magma palette")
# may
p2 <- ggplot()+ geom_raster(lmay, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km.2)) + scale_fill_viridis(option = "magma") +  ggtitle("magma palette")

# patchwork together
p1/p2

# crop the image
# longitude from 0 to 20
# latitude from 30 to 50
ext <- c(0, 20, 30, 50)
ljune_cropped <- crop(ljune, ext)
lmay_cropped <- crop(lmay, ext)
# stack_cropped <- crop(leafstack)

plot(ljune_cropped)
plot(lmay_cropped)

p1 <- ggplot()+ geom_raster(ljune_cropped, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km.1)) + scale_fill_viridis(option = "magma") +  ggtitle("magma palette")
p2 <- ggplot()+ geom_raster(lmay_cropped, mapping = aes(x = x, y = y, fill = Leaf.Area.Index.1km.2)) + scale_fill_viridis(option = "magma") +  ggtitle("magma palette")
p1/p2






