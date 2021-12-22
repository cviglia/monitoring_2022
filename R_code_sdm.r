# R code for Species Distribution Modelling

install.packages("sdm")

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm")
file # pathway to data
species <- shapefile(file) # as the raster function
species # looking at the set

# plot the species
plot(species, pch = 19, col = "red")




