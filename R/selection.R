#' @title Selection of important variables
#'
#' @description List of variables selected from the dataframe:
#' id, last_scraped, description, host_id, host_is_superhost,
#' host_has_profile_pic, host_identity_verified, neighbourhood,
#' neighbourhood_cleansed, latitude, longitude, property_type, room_type,
#' accommodates, bathrooms, bedrooms, beds, price, security_deposit,
#' cleaning_fee, guests_included, extra_people, minimum_nights,
#' number_of_reviews, first_review, last_review, review_scores_rating,
#' review_scores_accuracy, review_scores_cleanliness, review_scores_checkin,
#' review_scores_communication, review_scores_location, review_scores_value,
#' instant_bookable, cancellation_policy, calculated_host_listings_count,
#' reviews_per_month
#'
#' @param x dataframe
#'
#' @return dataframe
#' @export
#'

selection <- function(x){

  x <- x  %>% select(id, last_scraped, description, host_id, host_is_superhost,
                           host_has_profile_pic, host_identity_verified, neighbourhood,
                           neighbourhood_cleansed, latitude, longitude, property_type, room_type,
                           accommodates, bathrooms, bedrooms, beds, price, security_deposit,
                           cleaning_fee, guests_included, extra_people, minimum_nights,
                           number_of_reviews, first_review, last_review, review_scores_rating,
                           review_scores_accuracy, review_scores_cleanliness, review_scores_checkin,
                           review_scores_communication, review_scores_location, review_scores_value,
                           instant_bookable, cancellation_policy, calculated_host_listings_count,
                           reviews_per_month)
}

