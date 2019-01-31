#' Displaying data frame in a reportable table
#'
#' Using the \code{\link[kableExtra]{kable}}
#' Hint: Use x[1:7, 1:24] in order to show only part of the data
#' @param x data frame
#'
#' @return table output
#' @export
#'
#' @examples #' dataset_abc <- data.frame(
#'   "room_type" = c("Entire home/apt","Private room","Private room"),
#'  "host_is_superhost" = c("t","f", "t"),
#'  "instant_bookable" = c("t","t", "f"),
#'  "cancellation_policy" = c("strict_14_with_grace_period", "moderate", "flexible" ),
#'  stringsAsFactors=FALSE)
#'  kable_data(dataset_abc)

kable_data <- function(x){
  kable(x) %>%
    kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                  full_width = F, font_size = 10) %>%
    scroll_box(width = "910px", height = "400px")
}


