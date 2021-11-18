library(ggplot2)
library(knitr)

heart_df <- read.csv("heart.csv")

heart_plot <- ggplot(heart_df) +
  geom_point(mapping = aes(x = Age, y = RestingBP)) +
  labs(x = "Age", y = "Resting BP", title = "Age Vs Resting BP")