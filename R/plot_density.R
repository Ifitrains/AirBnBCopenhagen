#' Plot Density Price per Night
#'
#' It takes the log of the price and plots a density plot using ggplot2. It requires the variables
#' price_dkk and rtype
#'
#' @param x dataframe
#'
#' @return a density plot
#' @export
#'
#' @examples df <- data.frame(
#' "price_dkk" = c(200,500,1000),
#' "rtype" = c("Apartment", "Private Room", "Apartment"),
#'stringsAsFactors=FALSE)
#' plot_density(df)
#'
#'


plot_density <- function(infile){
  ggplot(infile, aes(x = log(price_dkk), color = rtype)) +
    geom_density(aes(fill = rtype, alpha = 0.5)) +
    labs(x = "Nightly Rental Price (Log)", y = "Density",
         title = "Price Density by Accommodation Type") +
    hrbrthemes::theme_ipsum() +
    hrbrthemes::theme_ipsum_rc(grid_col = "gray90")+
    theme(plot.title = element_text(size=12),
          legend.title = element_blank())
}


