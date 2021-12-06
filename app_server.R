library(shiny)
library(dplyr)
#library(ggplot2)
#library(tidyverse)
#library(plotly)

heart_df <- read.csv("heart.csv")

# Define server logic ----
server <- function(input, output) {
  
# CHART 1  
  
  plot_data <- heart_df %>%
    select(Age, RestingBP, Cholesterol)
  
  colnames(plot_data) <- c("Age", "Resting Blood Pressure", "Cholesterol")
  
  output$plot_1 <- renderPlot({
    options(scipen=10000)
    
    heart_data <- plot_data %>%
      filter(Age == input$age_range)
    
    ggplot(heart_data) +
      geom_line(aes(x = Age, y = .data[[input$category_chart_1]])) +
      labs(title = paste(input$age_range, "vs", input$category_chart_1), 
           x = "Age", 
           y = category_chart_1)
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