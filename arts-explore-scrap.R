#opening geojson file
library(sf)
arts.sf = st_read("ARTS_main_dataset.geojson")

R.version.string
update.packages(ask = FALSE, checkBuilt = TRUE)