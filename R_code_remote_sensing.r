# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://cran.r-project.org/web/packages/raster/index.html

install.packages("raster")

library(raster)

setwd("C:/lab/")

# we are going to import satellite data
# objects cannot be numbers
l2011 <- brick("p224r63_2011.grd")

l2011
plot(l2011)

cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011, col=cl)

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")

