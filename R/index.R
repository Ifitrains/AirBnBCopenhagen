

#' Review Index
#'
#' This function creates an addivtive index of six numeric variables which all relate to ratings concerning an Airbnb listing.
#' See the details in order to see which variables are included in the index.
#'
#' \itemize{
#' \item  review_scores_accuracy
#' \item  review_scores_cleanliness
#' \item  review_scores_checkin
#' \item  review_scores_communication
#' \item  review_scores_location
#' \item  review_scores_value
#' }
#'
#' @param x dataframe
#'
#' @return dataframe with a new variable "index"
#' @export
#'
#' @examples
#'
#'

index <- function(x){
  x <- x %>% mutate(
index = ((airbnb_clean$review_scores_accuracy + airbnb_clean$review_scores_cleanliness
          + airbnb_clean$review_scores_checkin +airbnb_clean$review_scores_communication
          + airbnb_clean$review_scores_location + airbnb_clean$review_scores_value)/6))
}
