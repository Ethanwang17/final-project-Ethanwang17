heart_df <- read.csv("/Users/ethan/Downloads/heart.csv")


chol_vs_restbp <- heart_df %>%
  select(Cholesterol, RestingBP) %>%
  ggplot +
  geom_line(mapping = aes(x = Cholesterol, y = RestingBP)) +
  scale_fill_manual(values=c("#E69F00"))+
  labs(x = "Cholesterol",
       y = "Resting Blood Pressure",
       title = "Cholesterol vs Blood Pressure")