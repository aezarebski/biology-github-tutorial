
#' Reshaped data in long format.
reshape_data <- function(my_data) {
  my_data %>%
    select(predictor1, predictor2, response, group) %>%
    melt(id.vars = "group")
}
