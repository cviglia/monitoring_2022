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

# ................................................. new day, new data

library(raster)
library(rgdal)

setwd("C:/lab/")  # windows

l2006 <- brick ("defor2.jpg") # image 2006
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")

# calculating energy in 1992
dvi1992 <- l1992$defor1.1 - l1992$defor1.2
# specifying a color scheme
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi1992, col=cl)

# calculating energy in 2006
dvi2006 <- l2006$defor2.1 - l2006$defor2.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
plot(dvi2006, col=cl)

# differencing two images of energy in two different times
dvidif <- dvi1992 - dvi2006
# plot the results
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvidif, col=cld)

# final plot: images, dvis, differences
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)

pdf("energy.pdf")
par(mfrow=c(3,2))
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="Lin")
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off() 

pdf("dvi.pdf")
par(mfrow=c(3,1))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
plot(dvidif, col=cld)
dev.off() 
