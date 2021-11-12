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

# set the working directory
setwd("C:/lab/")

# B1 is the reflectance in the blue band
# B2 is the reflectance in the green band
# B3 is the reflectance in the red band
# B4 is the reflectance in the NIR band

# .................................................................... day 2

library(raster)

setwd("C:/lab/")

l2011
plot(l2011)

plot(l2011$B2_sre)

cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011$B2_sre, col=cl)

# change the colorRampPalette with dark green, green and light green e.g. clg
clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(l2011$B2_sre, col=clg)

# change the colorRampPalette with dark blue, blue and light blue e.g. clb
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)
plot(l2011$B1_sre, col=clb)

# plot both images in just one multiframe graph
# one row, two columns
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# two rows, one column
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# .................................................................... day 3

library(raster)

setwd("C:/lab/")

l2011 <- brick("p224r63_2011.grd")
l2011

plot(l2011$B1_sre)

# plot the blue band using a blue colorRampPalette
clb <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(l2011$B1_sre, col=clb)

clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(l2011$B2_sre, col=clg)

# multiframe
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

# invert the number of rows and the number of columns
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)

clr <- colorRampPalette(c("dark red", "red", "pink"))(100)
plot(l2011$B3_sre, col=clr)

clnir <- colorRampPalette(c("red", "orange", "yellow"))(100)
plot(l2011$B4_sre, col=clnir)

# Exercise: plot the first four bands with two rows and two columns
par(mfrow=c(2,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
plot(l2011$B3_sre, col=clr)
plot(l2011$B4_sre, col=clnir)

dev.off()

par(mfrow=c(2,2))
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin") # natural colours
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin") # false colours
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")

# .................................................................... day 4

library(raster)

setwd("C:/lab/")

l2011 <- brick("p224r63_2011.grd")

plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Hist")

# importing past data
l1988 <- brick("p224r63_1988.grd")
l1988

par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")

# put the NIR in the blue channel
par(mfrow=c(2,1))
plotRGB(l1988, r=2, g=3, b=4, stretch="Lin")
plotRGB(l2011, r=2, g=3, b=4, stretch="Lin")
