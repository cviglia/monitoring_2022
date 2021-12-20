# ice melt in Greenland
# proxy: LST

library(raster)
library(ggplot2)
library(RStoolbox)
library(patchwork)
library(viridis)

# set the workind directory
setwd("C:/lab/greenland/")

rlist <- list.files(pattern = "lst")
rlist

import <- lapply(rlist, raster)
import

tgr <- stack(import)
tgr

cl <- colorRampPalette(c("blue","light blue","pink","yellow"))(100)
plot(tgr, col=cl)

# first and final images, 2000 vs 2015
ggplot() + geom_raster(tgr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2000")
ggplot() + geom_raster(tgr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2015")

# plot them together
p1 <- ggplot() + geom_raster(tgr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2000")
p2 <- ggplot() + geom_raster(tgr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) + scale_fill_viridis(option="magma") + ggtitle("LST in 2015")

# plot frequency distributions of data
hist(tgr$lst_2000)
hist(tgr$lst_2015)

par(mfrow=c(1,2))
hist(tgr$lst_2000)
hist(tgr$lst_2015)

par(mfrow=c(2,2))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)

plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500,15000), ylim=c(12500,15000))
abline(0, 1, col = "red")

# make a plot with all the histograms
par(mfrow=c(4,4))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)
plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500,15000), ylim=c(12500,15000))
plot(tgr$lst_2010, tgr$lst_2000, xlim=c(12500,15000), ylim=c(12500,15000))
plot(tgr$lst_2010, tgr$lst_2005, xlim=c(12500,15000), ylim=c(12500,15000))
# ...

pairs(tgr)







