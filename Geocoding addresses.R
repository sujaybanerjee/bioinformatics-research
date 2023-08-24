#Sujay Banerjee
#Geocoding Patient Addresses


library(ggmap)
library(tmaptools)
library(RCurl)
library(jsonlite)
library(tidyverse)
library(leaflet)
library(dplyr)


addressData <- read.csv("/Users/suj/Downloads/geocoded_addresses (1).csv")


#Google API key
register_google(key = "AIzaSyAq99By61nnwACL7fKHEN3nTxQ2jVB4rNw")


addresses_df <- data.frame(Addresses = addressData$geocode_col, stringsAsFactors = FALSE)

addresses_ggmap <- geocode(location = addressData$geocode_col, output = "more", source = "google")
addresses_ggmap <- cbind(addresses_df, addresses_ggmap)

addresses_ggmap <- unique(addresses_ggmap)

addresses_ggmap <- rename(addresses_ggmap, lng = lon)
addresses_ggmap <- rename(addresses_ggmap, type = id)

addresses_ggmap <- addresses_ggmap %>% mutate(id = row_number())


sum(is.na(addresses_ggmap))
nrow(addresses_ggmap)



addresses1half <- addresses_ggmap[1:16357,]
addresses2half <-addresses_ggmap[16358:32714,]



