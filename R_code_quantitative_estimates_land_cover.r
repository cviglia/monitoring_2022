# R_code_quantitative_estimates_land_cover

library(raster)
library(RStoolbox) # classification
library(ggplot2)
library(gridExtra) # multiframe ggplot

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

# Unsupervised claffication of 1992
l1992c <- unsuperClass(l1992, nClasses=2)  # unsuperClass(x, nClasses)

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
propagri <- 36016 / 341292         # ~ 0.11
propforest <- 305276 / 341292      # ~ 0.89

# build a dataframe
cover <- c("forest", "agriculture")
prop1992 <- c(propforest,  propagri)  # that means: prop1992 <- c(0.8944716,  0.1055284)

proportion1992 <- data.frame(cover, prop1992)

ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")



# Unsupervised claffication of 2006
l2006c <- unsuperClass(l2006, nClasses=2)  # unsuperClass(x, nClasses)

plot(l2006c$map)
# value 1 = agricultural areas and water
# value 2 = forests

freq(l2006c$map)
# value  count
# [1,]     1 164501
# [2,]     2 178225

# agricultural areas and water (class1)
# forests (class2)
total <- 342726
propagri2006 <- 164501/342726    # 0.4799782    ~ 0.48
propforest2006 <- 178225/342726    # 0.5200218  ~ 0.52

# build a dataframe
cover <- c("forest", "agriculture")
prop2006 <- c(propforest2006,  propagri2006) 

proportion2006 <- data.frame(cover, prop2006)
proportion <- data.frame(cover, prop1992, prop2006)

ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")

grid.arrange(p1, p2, nrows=1)



