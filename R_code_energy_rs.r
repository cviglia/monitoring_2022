# R code per estimating energy in ecosystems

# install.packages("raster")

library(raster)
setwd("C:/lab/")  # windows

# importing the data
l1992 <- brick("defor1.jpg") # image 1992
l1992
