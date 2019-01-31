#' Mapping Neighbourhoods Copenhagen
#'
#' @param infile geo data (polygon)
#' @param infile2 data frame including longitutde and latitude of listings
#'
#' @return a leaflet map including polygons of neighbourhoods
#' @export
#'

map_cph_nb <- function(infile, infile2){
suppressPackageStartupMessages(library(leaflet))
suppressPackageStartupMessages(library(leaflet.extras))

  borough_data <- infile2 %>%
    group_by(Neighbourhood) %>%
    nest() %>%
    mutate(center_lon=map_dbl(data, ~median(.$longitude)),
           center_lat=map_dbl(data, ~median(.$latitude)),
           number_listings=map_int(data, nrow))

  map_poly <- m %>%
    addProviderTiles("CartoDB.Positron", group="background 1") %>%
    addTiles(options = providerTileOptions(noWrap = TRUE), group="background 2") %>%
    addCircleMarkers(data=infile2, lng = ~ longitude, lat = ~ latitude, radius=1 , color="black",
                     fillColor="#ffa500", stroke = TRUE, fillOpacity = 2, group="AirBnB Listings") %>%
    addPolygons(data = infile, color = "#444444", weight = 2, opacity = 1, group = "Polygon") %>%
    addLayersControl(overlayGroups = c("AirBnB Listings", "Polygon") , baseGroups = c("background 1","background 2"),
                     options = layersControlOptions(collapsed = FALSE))%>%
    addLabelOnlyMarkers(data = borough_data,
                        lng = ~center_lon, lat = ~center_lat, label = ~Neighbourhood,
                        labelOptions = labelOptions(noHide = TRUE, direction = 'top', textOnly = TRUE,
                                                    opacity = 1,
                                                    textsize='15px')) %>%
    suspendScroll()
  return(map_poly)
}
