## Summary Table

library(tidyverse)

heart_df <- read.csv("heart.csv")

summary_table <- heart_df %>%
  filter(RestingBP > 0, Cholesterol > 0) %>%
  group_by(Age, HeartDisease) %>%
  summarise(Avg_RestingBP = mean(RestingBP), 
            Avg_Cholesterol = mean(Cholesterol),
            Avg_Max_HR = mean(MaxHR)
            )