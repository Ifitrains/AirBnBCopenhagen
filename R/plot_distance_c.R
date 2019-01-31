#' Plot Distance to city center
#'
#' Plotting the distance to the next metro station depending on its price (log)
#' Requires the variables price_dkk and dist_centrum
#'
#' @param infile
#'
#' @return a ggplot
#' @export
#'


plot_distance_c <- function(infile){

  ggplot(infile, aes(x= dist_centrum, y= log(price_dkk))) +
    geom_point() +
    geom_smooth(method = "lm") +
    labs(x = "Distance to the next Metro station (in meters)",
         y = "Nightly Rental Price (Log)",
         title = "Price vs. Distance to the next metro") +
    theme_ipsum() +
    theme_ipsum_rc(grid_col = "gray90") +
    theme(plot.title = element_text(size=12),
          legend.title = element_blank())
}
