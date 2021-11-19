## Summary Info

library(tidyverse)

heart_df <- read.csv("heart.csv")

# How many observations are there?
obs_heart <- heart_df %>%
  ncol()

# How many features are there?
feat_heart <- heart_df %>%
  nrow()

