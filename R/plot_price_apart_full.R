#' Night price distribution of entire apartments AirBnB CPH
#'
#' @param x a dataframe
#'
#' @return a ggplot (histogram)
#' @export
#'
#' @examples dataset_abc <- data.frame(
#' "room_type" = c("Entire home/apt","Entire home/apt","Private room"),
#' "price" = c("$100","$1500", "$300"), stringsAsFactors=FALSE)
#' plot_price_apart_full(dataset_abc)

plot_price_apart_full <- function(x) {
  x %>%
    mutate(price_dkk = as.numeric(gsub("[\\$,]", "", price))) %>%
    dplyr::filter(price_dkk < 2100 & room_type == "Entire home/apt") %>%
    ggplot(aes(x=price_dkk)) +
    stat_bin(breaks=seq(0,2100,50), fill="#69b3a2", color="#e9ecef", alpha=0.9) +
    hrbrthemes::theme_ipsum() +
    hrbrthemes::theme_ipsum_rc(grid_col = "gray90") +
    ggtitle("Night price distribution of AirBnB appartements") +
    labs(x="Price in DKK (Danish krone)")+
    theme(plot.title = element_text(size=12))
}







