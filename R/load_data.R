#' Read in csv files
#'
#' @param infile = the file name
#'
#' @return a dataframe
#'
#' @export
#'
#' @examples
#'
#' dataset_abc <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"), stringsAsFactors=FALSE)
#' dataset_csv <- write.table(dataset_abc, "filename.csv", sep = ",", row.names = F)
#' load_data2("filename.csv")
#'
load_data2 <- function(infile) {
  df <- readr::read_csv(infile)
  df
}




