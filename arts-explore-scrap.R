#opening geojson file
R.version.string
update.packages(ask = FALSE, checkBuilt = TRUE)
library(sf)
arts_sf = st_read("ARTS_main_dataset.geojson")

#explore mapping
library(ggplot2)
  #Region
arts_sf_subset1 <- arts_sf[arts_sf$RegionName == "Banks Island, Inuvik Region, Canada", ]
ggplot(data = arts_sf_subset1, aes(fill = TrainClass)) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL) 

arts_sf_subset3 <- arts_sf[arts_sf$RegionName == "Hot Weather Creek, Ellesmere, Canada", ]
ggplot(data = arts_sf_subset3, aes(fill = TrainClass)) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL)


  #divide by TrainClass
arts_sf_subset2 <- arts_sf[arts_sf$TrainClass == "Positive", ]
ggplot(data = arts_sf_subset1) + 
  geom_sf(col = "white") + 
  coord_sf(datum = NULL) 

#adding basemap?
