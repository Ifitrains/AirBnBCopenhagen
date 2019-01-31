#' Extra Informations:
#' It calculates the price per person per night and the duration the listings is available.
#'
#' @param x dataframe (after the use of \code{\link{clean_data}})
#'
#' @return dataframe with two new variables
#' @export
#'
#' @examples  dataset_abc <- data.frame(
#'   "price_dkk" = c(200, 300, 400),
#'  "accommodates"= c(2,5,20),
#'  "last_scraped" = c("2018-10-18","2018-10-18", "2018-10-18"),
#'  "first_review" = c("2018-10-17", "2018-01-18", "2016-10-05"),
#'  stringsAsFactors=FALSE)
#' extrainfo(dataset_abc)
extrainfo <- function(x){
  x <- x %>% mutate(
    listing_duration = as.numeric(difftime(x$last_scraped, x$first_review, unit = "days")),
    price_person = price_dkk/accommodates)
}

