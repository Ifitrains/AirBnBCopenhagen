#' Map of Copenhagen with some attributes
#'
#' @param infile dataframe of metro coordinates and names of metro stations
#' @param infile2 dataframe of listing coordinates
#'
#' @return a leaflet map
#' @export
#'

map_cph <- function(infile, infile2) {
# Create CPH Long Lat
m <- leaflet() %>% setView(lng = 12.568337, lat = 55.676098, zoom = 12) # Copenhagens
# Nyhavn Popup
nyhavn <- paste(sep = "<br/>",
                paste0("<b>Name: </b>", "Nyhavn"),
                paste0("<b>Place: </b>", "City Center, Copenhagen"),
                paste0("<a href='https://en.wikipedia.org/wiki/Nyhavn",
                       ... =   "'>Link</a>"))

map_nyhavn <- m %>%
  addProviderTiles("Esri.WorldImagery", group="background 1") %>%
  addTiles(options = providerTileOptions(noWrap = TRUE), group="background 2") %>%
  addCircles(data = infile, lng = ~long, lat = ~lat,popup = ~metro,
             fillColor="red", stroke = TRUE, fillOpacity = 0.8 ,
             radius = 80,group="Metro Stations") %>%
  addCircleMarkers(data=infile2, lng = ~ longitude,
                   lat = ~ latitude, radius=1 , color="black",
                   fillColor="#ffa500", stroke = TRUE, fillOpacity = 2,
                   group="AirBnB Listings",
                   clusterOptions = markerClusterOptions()) %>%
  addLayersControl(overlayGroups = c("Metro Stations","AirBnB Listings") ,
                   baseGroups = c("background 1","background 2"),
                   options = layersControlOptions(collapsed = FALSE))%>%
  suspendScroll()


map_nyhavn %>% addMarkers(lat =55.679687, lng = 12.590659, popup=nyhavn)
}
