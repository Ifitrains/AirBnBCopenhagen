#' Regression Table
#'
#' @param infile Regression Model
#' @param infile2 Regression Model
#' @param infile3 Regression Model
#' @param infile4 Regression Model
#' @param infile5 Regression Model
#'
#' @return stargazer table output html
#' @export
#'
regression_table <- function(infile,infile2,infile3,infile4, infile5){
  library(stargazer)
  stargazer(infile, infile2, infile3, infile4, infile5,
            type = "html",
            title = "Linear Regression Model",
            style = "ajs",
            summary = NULL,
            out.header = FALSE,
            column.labels = c("Distance", "Property", "Rules",
                              "Reputation", "Full"),
            covariate.labels = c("Distance Metro",
                                 "Distance Centre (Proxy)",
                                 "Apartment (Dummy)",
                                 "Accomodates",
                                 "Number of Bathrooms",
                                 "Strict Cancel",
                                 "Instant Booking",
                                 "Minimum nights",
                                 "Cleaning Fee",
                                 "Review Index",
                                 "Superhost",
                                 "Listings duration"),
            dep.var.caption = "Dep. Var",
            star.cutoffs = c(0.05,0.01,0.001),
            dep.var.labels = c("Log Price per night in DKK"))
}
