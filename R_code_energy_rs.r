# R code per estimating energy in ecosystems

# install.packages("raster")

library(raster)
setwd("C:/lab/")  # windows

# install.packages("rgdal")
library(rgdal)

# importing the data
l1992 <- brick("defor1.jpg") # image 1992
l1992

# Bands: defor1.1, defor1.2, defor1.3 
# plot RGB
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# defor1.1 = NIR
# defor1.2 = red
# defor1.3 = green

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
