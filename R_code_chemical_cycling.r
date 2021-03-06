# R code for chemical cycling study
# time series of NO2 change in Europe during the lockdown
# https://www.esa.int/Applications/Observing_the_Earth/Copernicus/Sentinel-5P/Coronavirus_lockdown_leading_to_drop_in_pollution_across_Europe
# https://acp.copernicus.org/preprints/acp-2020-995/acp-2020-995.pdf

library(raster)

# set the working directory
setwd("C:/lab/en/") 
 
en01 <- raster("EN_0001.png")
en01
# range of data? 0, 255
# https://www.google.com/search?q=R+colours+names&tbm=isch&ved=2ahUKEwiF-77Z1bX0AhULtKQKHQ3WDWYQ2-cCegQIABAA&oq=R+colours+names&gs_lcp=CgNpbWcQAzIECAAQEzoHCCMQ7wMQJzoICAAQCBAeEBNQiQhYnwxgwg1oAHAAeACAAUqIAZYDkgEBNpgBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=vKKgYYWtOovokgWNrLewBg&bih=526&biw=1056#imgrc=OtMzJfyT_OwIiM
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

# plot theNO2 values of january
cl <- colorRampPalette(c("red","orange","yellow"))(100) # 
plot(en01, col=cl)

# import the end of march NO2 and plot it
en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# build a multiframe window
par(mfrow=c(2,1))
plot(en01, col=cl)
plot(en13, col=cl)

# import all the images
en01 <- raster("EN_0001.png")
en02 <- raster("EN_0002.png")
en03 <- raster("EN_0003.png")
en04 <- raster("EN_0004.png")
en05 <- raster("EN_0005.png")
en06 <- raster("EN_0006.png")
en07 <- raster("EN_0007.png")
en08 <- raster("EN_0008.png")
en09 <- raster("EN_0009.png")
en10 <- raster("EN_0010.png")
en11 <- raster("EN_0011.png")
en12 <- raster("EN_0012.png")
en13 <- raster("EN_0013.png")

# plot all the data together
par(mfrow=c(4,4))
plot(en01, col=cl)
plot(en02, col=cl)
plot(en03, col=cl)
plot(en04, col=cl)
plot(en05, col=cl)
plot(en06, col=cl)
plot(en07, col=cl)
plot(en08, col=cl)
plot(en09, col=cl)
plot(en10, col=cl)
plot(en11, col=cl)
plot(en12, col=cl)
plot(en13, col=cl)

# make a stack
en <- stack(en01, en02, en03, en04, en05, en06, en07, en08, en09, en10, en11, en12, en13)
en

# plot the stack all together
plot(en, col = cl)

# plot only the first image from the stack
plot(en$EN_0001, col=cl)

# plot(RGB)
plotRGB(en, r=1, g=7, b=13, stretch="lin")

# ...................................................... day 2

library(raster)

# set the working directory
setwd("C:/lab/en/") 

# importing all the data with lapply function
#list
rlist<- list.files(pattern = "EN")
rlist

#lapply
list_rast <- lapply(rlist, raster)
list_rast

#stack
ENstack <- stack(list_rast)
ENstack

# palette
cl <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(ENstack, col=cl)

# exercise: plot only the first image of the stack
plot(ENstack$EN_0001, col=cl)

# processing the data
# difference
ENdif <- ENstack$EN_0001 - ENstack$EN_0013
cldif <- colorRampPalette(c('blue','white','red'))(100) # 
plot(ENdif, col=cldif)

# automated processing source function
source("script.txt")

# pairs
pairs(en)
