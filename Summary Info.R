## Summary Info

library(tidyverse)

heart_df <- read.csv("heart.csv")


## BASIC INFO ------------------------------------------------------------------
# How many observations are there?
obs_heart <- heart_df %>%
  ncol()

# How many features are there?
feat_heart <- heart_df %>%
  nrow()

# What is the average age of the dataset?
avg_age <- heart_df %>%
  summarise(avg_age = mean(Age)) %>%
  pull(avg_age)

# What is the median age of the dataset? 
med_age <- heart_df %>%
  summarise(med_age = median(Age)) %>%
  pull(med_age)


# What is the male to female ratio within the dataset?
male_count <- heart_df %>%
  filter(Sex == "M") %>%
  nrow()

female_count <- heart_df %>%
  filter(Sex == "F") %>%
  nrow()

male_female_ratio <- male_count / female_count

# What is the average cholesterol
# What is the average resting blood pressure


## HEART DISEASE ---------------------------------------------------------------
# How many people have a heart disease?
heart_disease_count <- heart_df %>%
  filter(HeartDisease == 1) %>%
  nrow()

# What is the average age for those who have a heart disease
heart_disease_avg_age <- heart_df %>%
  filter(HeartDisease == 1) %>%
  summarise(avg_age = mean(Age)) %>%
  pull(avg_age)

# What is the average cholesterol levels for those with heart disease
heart_disease_avg_cholest <- heart_df %>%
  filter(HeartDisease == 1) %>%
  summarise(avg_cholest = mean(Cholesterol)) %>%
  pull(avg_cholest)

# What is the average resting blood pressure for those with heart disease
heart_disease_avg_rest_BP <- heart_df %>%
  filter(HeartDisease == 1) %>%
  summarise(avg_rest_BP = mean(RestingBP)) %>%
  pull(avg_rest_BP)

## EXERCISE ANGINA -------------------------------------------------------------
# How many people have exercise angina (chest pain during exercise)
exercise_angina_count <- heart_df %>%
  filter(ExerciseAngina == "Y") %>%
  nrow()

# What is the average age 
exercise_angina_avg_age <- heart_df %>%
  filter(ExerciseAngina == "Y") %>%
  summarise(avg_age = mean(Age)) %>%
  pull(avg_age)

# What is the average cholesterol level
exercise_angina_avg_cholest <- heart_df %>%
  filter(ExerciseAngina == "Y") %>%
  summarise(avg_cholest = mean(Cholesterol)) %>%
  pull(avg_cholest)

# What is the average resting blood pressure
exercise_angina_avg_rest_BP <- heart_df %>%
  filter(ExerciseAngina == "Y") %>%
  summarise(avg_rest_BP = mean(RestingBP)) %>%
  pull(avg_rest_BP)
