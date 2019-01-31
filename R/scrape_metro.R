#' Scraping Geo-Coordinates from Wikipedia
#'
#' This functions aims at wikipedia tables that include links (hrefs) to other wikipedia sites
#' where the coordinates are located.
#'
#' @param x URL
#'
#' @return geo coordinates
#' @export
#'
#' @examples
#' metroURL <- "https://en.wikipedia.org/wiki/List_of_Copenhagen_Metro_stations"
#' geo_metro(metroURL)

geo_metro <- function(x){
  metro_scrap <- x %>%
    xml2::read_html() %>%
    html_nodes(xpath='//th') %>% html_nodes("a") %>% html_attr("href") %>%
    na.omit() %>%
    paste0("https://en.wikipedia.org", .)

  names <- map_df(metro_scrap[1:22], ~ tibble(names = read_html(.) %>% html_nodes("#firstHeading") %>% html_text())) %>% distinct()
  geo <- map_df(metro_scrap[1:22], ~ tibble(coor = read_html(.) %>% html_nodes(".geo") %>% html_text())) %>%
    distinct()

  Numextract_coord <- function(string){
    as.data.frame(as.numeric(unlist(regmatches(string, gregexpr("[[:digit:]]+\\.*[[:digit:]]*", string)))))
  }

  df <- Numextract_coord(geo$coor)
  lng <- df %>% dplyr::filter(row_number() %% 2 == 0) ## Select even rows
  lat <- df %>% dplyr::filter(row_number() %% 2 == 1) ## Select odd rows

  metro_df <- cbind(names, lat,lng)
  colnames(metro_df) <- c("metro","lat", "long")
  return(metro_df)
}


