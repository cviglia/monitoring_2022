# R code for measuring community interactions!

install.packages("vegan")
library(vegan)

# set the work dir
setwd("C:/lab/")

# species
load("biomes_multivar.RData")
ls()

# plot per species matrix
head(biomes)

multivar <- decorana(biomes)
multivar

# plot the data
plot(multivar)

# biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col = c("black", "red", "green", "blue"), kind = "ehull", lwd =3)

ordispider(multivar, type, col=c("black","red","green","blue"), label=T)

install.packages("sdm")


