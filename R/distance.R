#' Distance from two points or two vectors
#'
#' @param long1 Longitude of first data set
#' @param lat1 Latitude of first data set
#' @param long2 Longitude of second data set
#' @param lat2 Latitude of second data set
#'
#' @return a vector of distances
#' @export
#'
#' @examples
#' distance(c(12.12345,14.14244),
#'  c(14.12345, 15.2355),
#'  50.2345,
#'  11.223415)



distance <- function(long1, lat1, long2, lat2){
  dist_metacc <- geosphere::distm(cbind(long1, lat1),
                                  cbind(long2, lat2),
                                fun = distHaversine)

  dist <- matrixStats::rowMins(as.matrix(dist_metacc))

  return(dist)
}



