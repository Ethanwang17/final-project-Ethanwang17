library(shiny)
library(dplyr)
#library(ggplot2)
#library(tidyverse)
#library(plotly)

heart_df <- read.csv("heart.csv")

cat_chart_1 <- heart_df %>%
  select(RestingBP, Cholesterol) %>%
  unique()

# Define server logic ----
server <- function(input, output) {
  
# CHART 1  
  
  plot_data <- heart_df %>%
    select(Age, RestingBP, Cholesterol)
  
  colnames(plot_data) <- c("Age", "Resting Blood Pressure", "Cholesterol")
  
  output$plot_1 <- renderPlot({
    options(scipen=10000)
    
    heart_data <- plot_data %>%
      filter(Age >= input$age_range[1] & Age <= input$age_range[2])
    
    ggplot(heart_data) +
      geom_point(aes(x = Age, y = .data[[input$category_chart]])) +
      labs(title = paste(input$age_range, "vs", input$category_chart), 
           x = "Age", 
           y = input$category_chart)
  })

# CHART 2
  output$plot_2 <- renderPlot({
    plot_2_data <- heart_df %>%
      select(Sex, Cholesterol, RestingBP, MaxHR)
    
    colnames(plot_2_data) <- c("Sex", "Cholesterol",
                               "Resting Blood Pressure", "Max Heart Rate")
    plot_2_data <- plot_2_data %>%
      filter(Sex == input$sex)
    
    ggplot(plot_2_data) +
      geom_boxplot(aes(x = Sex,
                       y = .data[[input$category_chart_2]]))
  })
}