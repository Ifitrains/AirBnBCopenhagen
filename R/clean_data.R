#' Clean data from inside.airbnb.com
#'
#' It filters for verified hosts only and set the minimum requirement of reviews to 4.
#' This function is designed for Danish data only as it transforms the price-related variables in a Danish Kroner format.
#' Lastly, it filters for a price per night between the following range: [0-7400] which approximately displays [0-1000 Euro]
#'
#' @param x dataframe
#'
#' @return x dataframe
#'
#' @export
#'
#' @examples
#' dataset_abc <- data.frame("host_identity_verified" = c(TRUE,FALSE,TRUE), "number_of_reviews" = c(1,4,6),
#' "cleaning_fee" = c("$20","$25", "$22"),
#' "price" = c("$100","$200", "$300"), "extra_people"= c("$3", "$6", "$2"),
#' security_deposit= c("$1000","$2002", "$3003"), stringsAsFactors=FALSE)
#' clean_data(dataset_abc)
#'


clean_data <- function(x) {
  x  %>%
    filter(host_identity_verified == "TRUE" & number_of_reviews > 3)  %>%
    mutate(cleaning_fee_dkk = as.numeric(gsub("[\\$,]", "", cleaning_fee))) %>%
    mutate(price_dkk = as.numeric(gsub("[\\$,]", "", price))) %>%
    mutate(extra_people_dkk = as.numeric(gsub("[\\$,]", "", extra_people))) %>%
    mutate(security_deposit_dkk = as.numeric(gsub("[\\$,]", "", airbnb_clean$security_deposit))) %>%
    filter(price_dkk > 0 & price_dkk < 7400)
}


