library(ggplot2)
library(reshape2)
library(magrittr)
library(dplyr)

## =========================================================
## Load the data so we have something to plot.
## =========================================================

my_data <- read.csv("iris.csv")

## =========================================================
## Reshape the data so that it is in a more convenient form
## for plotting with ggplot2.
## =========================================================

my_data$predictor1 <- my_data$Sepal.Length
my_data$predictor2 <- my_data$Sepal.Width
my_data$response <- my_data$Petal.Length
my_data$group <- my_data$Species

plot_data <- my_data %>%
  select(predictor1, predictor2, response, group) %>%
  melt(id.vars = "group")

## =========================================================
## Plot the data and save the result so we can see it after
## we close the R session.
## =========================================================

fig_a <- ggplot() +
  geom_point(
    data = plot_data,
    mapping = aes(x = group, y = value, colour = variable)
  )

ggsave(filename = "fig-a.png",
       plot = fig_a,
       height = 7.4, width = 10.5,
       units = "cm")
