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

#spatial autocorrelation
library(tmap)
tm_shape(arts_sf_subset1) + tm_polygons(style="equal", border.col = "grey80", lwd = 0.5,
                                col = "CreatorLab", palette="Greens") +
  tm_legend(outside = TRUE, text.size = .8)  +
  tm_layout(frame = FALSE)

library(tidyverse)
library(here)
library(magrittr)
library(sf)
library(tmap)
library(janitor)
library(RColorBrewer)
library(spatstat)
library(raster)
library(rosm)
library(dbscan)
library(leaflet)
library(spdep)

xy <- st_centroid(arts_sf)
s.dist <- dnearneigh(xy, 0, 500)
s.dist[[1]] |> length()
annulus1 <- arts_sf[s.dist[[1]], "MergedRTS"] 