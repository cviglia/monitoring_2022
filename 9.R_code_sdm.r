# R code for Species Distribution Modelling, namely the distribution of individuals of a population in space

install.packages("sdm")

library(sdm)
library(raster) # predictors
library(rgdal) # species: an array of x,y points x0,y0, x1y1...

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
# you can use the lapply function with the raster function but in this case it is not needed since the data are inside the package and they have an asc extension
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

# ........................................................................................... day 2
# importing the source script

library(sdm)
library(raster)
library(rgdal)

# set the working directory
setwd("C:/lab/")

source("R_code_source_sdm.r") # graphs will appear

# in the theoretical slide of SDMs we should use individuals of a species and predictors 
preds
# predictors are: elevation, precipitation, temperature, vegetation
 
# set the data for the sdm
sdmData(train=species, predictors=preds)

# Let's explain to the model what are the training and predictors data
datasdm <- sdmData(train=species, predictors=preds)

# model
m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glm")
m1

# ........................................................................................... day 3

library(sdm)
library(raster)
library(rgdal)

setwd("C:/lab/")

# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)
datasdm

# model
m1 <- sdm(Occurrence~temperature+elevation+precipitation+vegetation, data=datasdm, methods="glm")
m1

# make the raster output layer
# prediction: map probability
p1 <- predict(m1, newdata=preds)
p1

# plot the output
plot(p1, col=cl)
points(presences, pch=16)

# final stack with everything
s1 <- stack(preds, p1)
plot(s1, col=cl)

# let's decide names
names(s1) <- c("Elevation", "Precipitation", "Temperature", "Vegetation", "Probability")
plot(s1, col=cl)

                   
                   
                   

