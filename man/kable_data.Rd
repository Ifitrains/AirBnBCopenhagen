% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kable_data.R
\name{kable_data}
\alias{kable_data}
\title{Displaying data frame in a reportable table}
\usage{
kable_data(x)
}
\arguments{
\item{x}{data frame}
}
\value{
table output
}
\description{
Using the \code{\link[kableExtra]{kable}}
Hint: Use x[1:7, 1:24] in order to show only part of the data
}
\examples{
#' dataset_abc <- data.frame(
  "room_type" = c("Entire home/apt","Private room","Private room"),
 "host_is_superhost" = c("t","f", "t"),
 "instant_bookable" = c("t","t", "f"),
 "cancellation_policy" = c("strict_14_with_grace_period", "moderate", "flexible" ),
 stringsAsFactors=FALSE)
 kable_data(dataset_abc)
}
