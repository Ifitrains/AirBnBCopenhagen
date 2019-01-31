#' Estimate models with robust standard errors
#'
#' @param Data data frame
#'
#' @return 4 regressions and 2 latex ouput
#' @export
#'
regression_cph <- function(Data) {
  library(lmtest)
  library(sandwich)
  mod1 <- lm(price_dkk %>% log() ~ distance + dist_centrum,data = Data )
  mod2 <- lm(price_dkk %>% log() ~ distance + dist_centrum+ home+ accommodates + bathrooms, data = Data)
  mod3 <- lm(price_dkk %>% log() ~ distance + dist_centrum +
               strict_cancel + instant + minimum_nights + cleaning_fee_dkk, data = Data)
  mod4 <- lm(price_dkk %>% log() ~ distance + dist_centrum + +
               index + superhost+
               listing_duration, data = Data)
  mod5 <- lm(price_dkk %>% log() ~  distance + dist_centrum +
             home + accommodates + bathrooms + strict_cancel+ instant + minimum_nights+cleaning_fee_dkk+
               index + superhost + listing_duration, data = Data)
  mod1_rob <- coeftest(mod1, vcov=vcovHC(mod1))
  mod2_rob <- coeftest(mod2, vcov=vcovHC(mod2))
  mod3_rob <- coeftest(mod3, vcov=vcovHC(mod3))
  mod4_rob <- coeftest(mod4, vcov=vcovHC(mod4))
  mod5_rob <- coeftest(mod5, vcov=vcovHC(mod5))

}
