# R_code_quantitative_estimates_land_cover

library(raster)
library(RStoolbox)
library(ggplot2)

# set working directory
setwd("C:/lab/") 

# brick
# 1 list the files available
rlist <- list.files(pattern="defor")
rlist

# 2 lapply: apply a function to a list
list_rast <- lapply(rlist, brick)
list_rast

plot(list_rast[[1]])

# defor: NIR 1, red 2, green3
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Unsupervised claffication
l1992c <- unsuperClass(l1992, nClasses=2)

plot(l1992c$map)
# value 1 = agricultural areas and water
# value 2 = forests

freq(l1992c$map)
# value count
# [1,]     1  36016
# [2,]     2 305276

# agricultural areas and water (class1)
# forests (class2)

# 36016 + 305276 =  341292
total <- 341292
propagri <- 36016 / 341292         # 0.11
propforest <- 305276 / 341292      # 0.89

# build a dataframe
cover <- c("forest", "agriculture")
prop1992 <- c(0.8944716,  0.1055284)

proportion1992 <- data.frame(cover, prop1992)

ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")

