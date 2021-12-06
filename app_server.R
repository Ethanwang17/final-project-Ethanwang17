library(shiny)
library(dplyr)
#library(ggplot2)
#library(tidyverse)
#library(plotly)

heart_df <- read.csv("heart.csv")

# Define server logic ----
server <- function(input, output) {
  
# CHART 1  
  output$plot_1 <- renderPlot({
    #options(scipen=10000)
    
    plot_1_data <- heart_df %>%
      filter(Age >= input$age_range[1] & Age <= input$age_range[2])
    
    ggplot(plot_1_data) +
      geom_point(aes(x = Age, y = RestingBP)) +
      labs(title = "Age vs Resting BP", 
           x = "Age", 
           y = "Resting BP")
    
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