#opening geojson file
R.version.string
update.packages(ask = FALSE, checkBuilt = TRUE)
library(sf)
arts_sf = st_read("ARTS_main_dataset.geojson")
st_crs(arts_sf)
arts_sf

#explore mapping
library(ggplot2)
library(ggmap)
library(png)
library(grid)

#Region = Banks Island
arts_sf_subset1 <- arts_sf[arts_sf$RegionName == "Banks Island, Inuvik Region, Canada", ]
test_layer <- ggplot(data = arts_sf_subset1, aes(fill = TrainClass)) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL) +
  theme_void()

#Region = Hot Weather Creek
arts_sf_subset3 <- arts_sf[arts_sf$RegionName == "Hot Weather Creek, Ellesmere, Canada", ]
ggplot(data = arts_sf_subset3, aes(fill = TrainClass)) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL)
summary(arts_sf_subset3)


#divide by TrainClass
arts_sf_subset2 <- arts_sf[arts_sf$TrainClass == "Positive", ]
ggplot(data = arts_sf_subset1) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL) 

#adding basemap?
site_map + geom_sf(data = arts_sf_subset1, aes(fill = TrainClass), col = "red")
site_map + geom_sf(data = arts_sf_subset2, aes(fill = TrainClass), col = "red")
site_map + geom_sf(data = arts_sf_subset3, aes(fill = TrainClass), col = "red")
site_map + geom_sf(data = arts_sf, aes(fill = TrainClass), col = "red")

#scratch

