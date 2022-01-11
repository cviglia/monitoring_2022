# R code for Species Distribution Modelling

install.packages("sdm")

library(sdm)
library(raster) # predictors
library(rgdal) # species

# species data
file <- system.file("external/species.shp", package="sdm")
file # pathway to data

species <- shapefile(file) # as the raster function for raster files
species # looking at the set

# how many occurrences are there?
presences <- species [species$Occurrence == 1, ]
absences <- species [species$Occurrence == 0, ]

# plot the species
plot(species, pch = 19, col = "blue")

# plot pres and abs
plot(presences, pch=19, col="blue")
plot(absences, pch = 19, col = "red")

# let's look at the predictors
path <- system.file("external", package="sdm")
path

# list the predictors
lst <- list.files(path, pattern='asc', full.names=T)

# stack
preds <- stack(lst)

# col
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

# elevation
plot(preds$elevation, col=cl)
points(presences, pch=19)

# temperature
plot(preds$temperature, col=cl)
points(presences, pch=19)

# vegetation
plot(preds$vegetation, col=cl)
points(presences, pch=19)

# ........................................................................................... 

library(sdm)
library(raster)
library(rgdal)

setwd("C:/lab/")

source("R_code_source_sdm.r") # graphs will appear

# in the theoretical slide of sdms we should use individuals of a species and predictors
preds
# predictors are: elevation, precipitation, temperature, vegetation

sdmData(train=species, predictors=preds)

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glm")
m1


                   
                   
                   
                   

