library(ggplot2)
library(reshape2)
library(magrittr)
library(dplyr)

## =========================================================
## Load the data so we have something to plot.
## =========================================================

my_data <- read.csv("mtcars-renamed.csv")

## =========================================================
## Reshape the data so that it is in a more convenient form
## for plotting with ggplot2.
## =========================================================

source("reshape-data-function.R")
plot_data <- reshape_data(my_data)

## =========================================================
## Plot the data and save the result so we can see it after
## we close the R session.
## =========================================================

fig_b <- ggplot() +
  geom_point(
    data = plot_data,
    mapping = aes(x = group, y = value, colour = variable)
  ) +
  scale_y_log10()

ggsave(filename = "fig-b.png",
       plot = fig_b,
       height = 7.4, width = 10.5,
       units = "cm")
