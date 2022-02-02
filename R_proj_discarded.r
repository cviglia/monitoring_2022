
# cividis
# ggplot() + geom_raster(veg8_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg8_cropped cividis")

# cividis
# ggplot() + geom_raster(veg7_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg7_cropped cividis")

# cividis
# ggplot() + geom_raster(veg6_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg6_cropped cividis")

# cividis
# ggplot() + geom_raster(veg5_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg5_cropped cividis")

# cividis
# ggplot() + geom_raster(veg4_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg4_cropped cividis")

# cividis
# ggplot() + geom_raster(veg3_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg3_cropped cividis")

# cividis
# ggplot() + geom_raster(veg2_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg2_cropped cividis")

# cividis
# ggplot() + geom_raster(veg1_cropped, mapping = aes(x = x, y = y, fill =  Normalized.Difference.Vegetation.Index.333M)) + scale_fill_viridis(option = "cividis") +  ggtitle("veg1_cropped cividis")





##############################################
## lapply 
rlist <- list.files(pattern="NDVI")
rlist

list_rast <- lapply(rlist, raster)
list_rast


l2021 <- vegstack$Normalized.Difference.Vegetation.Index.333M.8
l2020 <- vegstack$Normalized.Difference.Vegetation.Index.333M.7
l2019 <- vegstack$Normalized.Difference.Vegetation.Index.333M.6
l2018 <- vegstack$Normalized.Difference.Vegetation.Index.333M.5
l2017 <- vegstack$Normalized.Difference.Vegetation.Index.333M.4
l2016 <- vegstack$Normalized.Difference.Vegetation.Index.333M.3
l2015 <- vegstack$Normalized.Difference.Vegetation.Index.333M.2
l2014 <- vegstack$Normalized.Difference.Vegetation.Index.333M.1


# crop!
ext <- c(11.9256, 15.6528, 35.4929, 38.8122)
l2021_cropped <- crop(l2021, ext)
l2020_cropped <- crop(l2020, ext)
l2019_cropped <- crop(l2019, ext)
l2018_cropped <- crop(l2018, ext)
l2017_cropped <- crop(l2017, ext)
l2016_cropped <- crop(l2016, ext)
l2015_cropped <- crop(l2015, ext)
l2014_cropped <- crop(l2014, ext)


plot(l2021_cropped)
plot(l2020_cropped)
plot(l2019_cropped)
plot(l2018_cropped)
plot(l2017_cropped)
plot(l2016_cropped)
plot(l2015_cropped)
plot(l2014_cropped)


p8 <- ggplot()+ geom_raster(l2021_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.8)) + scale_fill_viridis(option = "cividis") +  ggtitle("2021")
p7 <- ggplot()+ geom_raster(l2020_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.7)) + scale_fill_viridis(option = "cividis") +  ggtitle("2020")
p6 <- ggplot()+ geom_raster(l2019_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.6)) + scale_fill_viridis(option = "cividis") +  ggtitle("2019")
p5 <- ggplot()+ geom_raster(l2018_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.5)) + scale_fill_viridis(option = "cividis") +  ggtitle("2018")
p4 <- ggplot()+ geom_raster(l2017_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.4)) + scale_fill_viridis(option = "cividis") +  ggtitle("2017")
p3 <- ggplot()+ geom_raster(l2016_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.3)) + scale_fill_viridis(option = "cividis") +  ggtitle("2016")
p2 <- ggplot()+ geom_raster(l2015_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.2)) + scale_fill_viridis(option = "cividis") +  ggtitle("2015")
p1 <- ggplot()+ geom_raster(l2014_cropped, mapping = aes(x = x, y = y, fill = Normalized.Difference.Vegetation.Index.333M.1)) + scale_fill_viridis(option = "cividis") +  ggtitle("2014")

assign("Vegetation_Amount", Normalized.Difference.Vegetation.Index.333M.8) 


grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8, nrow = 4)

grid.arrange(
  p1,
  p2,
  p3,
  p4,
  p5,
  p6,
  p7,
  p8,
  nrow = 4,
  top = "Extension of Vegetation",
  bottom = textGrob(
    "",
    gp = gpar(fontface = 3, fontsize = 9),
    hjust = 1,
    x = 1
  )
)


p8 <- ggplot()+ geom_raster(l2021_cropped, mapping = aes(x = x, y = y, fill = )) + scale_fill_viridis(option = "cividis") +  ggtitle("2021")
p7 <- ggplot()+ geom_raster(l2020_cropped, mapping = aes(x = x, y = y, fill = )) + scale_fill_viridis(option = "cividis") +  ggtitle("2020")

