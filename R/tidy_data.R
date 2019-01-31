
#' Recoding inside dataset
#'
#' This function creates dummy variables of four variables (see the example)
#'
#' @param x dataframe
#'
#' @return x dataframe
#'
#' @export
#'
#' @examples
#' dataset_abc <- data.frame(
#'   "room_type" = c("Entire home/apt","Private room","Private room"),
#'  "host_is_superhost" = c("t","f", "t"),
#'  "instant_bookable" = c("t","t", "f"),
#'  "cancellation_policy" = c("strict_14_with_grace_period", "moderate", "flexible" )
#'  stringsAsFactors=FALSE)
#' tidy_data(dataset_abc)
#'


tidy_data <- function(x){

  x <- x %>% mutate(
    superhost = case_when(
      host_is_superhost == "TRUE" ~ 1,
      host_is_superhost == "FALSE" ~ 0
    ),
    instant = case_when(
      instant_bookable == "TRUE" ~ 1,
      instant_bookable == "FALSE" ~ 0
    ),
    home = case_when(
      room_type == "Shared room" ~ NA_real_, # drop Shared Rooms
      room_type == "Entire home/apt" ~ 1,
      room_type == "Private room" ~ 0
    ),
    strict_cancel = case_when(
      cancellation_policy == "strict_14_with_grace_period" ~ 1,
      cancellation_policy == "moderate" ~ 0,
      cancellation_policy == "flexible" ~ 0
    ))
  }

