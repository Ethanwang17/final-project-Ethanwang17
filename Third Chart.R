library(tidyverse)
library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/
info201b-2021-aut/final-project-Ethanwang17/main/heart.csv?token=AV5GBVXBLQE4CWHY2C2TLRTBUET5S")

theme_update(plot.title = element_text(hjust = 0.5))

average <- group_by(data, ChestPainType) %>%
  summarize(mean(Cholesterol)) %>%
  mutate(average)

colnames(average) <- c('ChestPainType','AverageCholesterol')

bar_chart <- ggplot(data=data, aes(x=ChestPainType, y=Cholesterol), fill="ChestPainType") +
  geom_bar(stat="identity", width=0.35) + ggtitle("ChestPainType vs Cholesterol")

bar_average <- ggplot(data=average, aes(x=ChestPainType, y=AverageCholesterol), fill="ChestPainType") +
  geom_bar(stat="identity", width=0.35) + ggtitle("ChestPainType vs Cholesterol Average")

bar_count <- ggplot(data=data, aes(x=ChestPainType), fill="ChestPainType") +
  geom_bar(stat="count", width=0.35) + ggtitle("Number of ChestPainType Cases")
