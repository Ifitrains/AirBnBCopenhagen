#' Cleaning and correction of mispellings
#'
#' Detect the presence of misspellings and add the correct form in a new variable called
#' Neighbourhood.
#' @param x dataframe
#'
#' @return dataframe with its new variable
#' @export
#'
#' @examples dataset_abc <- data.frame(
#'"neighbourhood_cleansed" = c("Amager st","Amager Vest", "Vanlse", "Nrrebro$"),
#' "first_review" = c("2018-10-17", "2018-01-18", "2016-10-05", "2016"),
#' stringsAsFactors=FALSE)
#' clean_names_nh(dataset_abc)

clean_names_nh <- function(x){
x <- x %>%
  mutate(Neighbourhood=case_when(
    str_detect(neighbourhood_cleansed, "Amager st") ~ "Amager Strand",
    str_detect(neighbourhood_cleansed, "Amager Vest") ~ "Amager Vest",
    str_detect(neighbourhood_cleansed, "Vanlse") ~ "Vanløse",
    str_detect(neighbourhood_cleansed, "Nrrebro") ~ "Nørrebro",
    str_detect(neighbourhood_cleansed, "Brnshj-Husum") ~ "Brønshøj",
    str_detect(neighbourhood_cleansed, "sterbro") ~ "Østerbro",
    str_detect(neighbourhood_cleansed, "Vesterbro-Kongens Enghave") ~ "Vesterbro",
    TRUE ~ neighbourhood_cleansed
  ))
}
