library(shiny)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)

heart_df <- read.csv("heart.csv")

all_age <- heart_df %>%
  select(Age) %>%
  unique()

# Define server logic ----
server <- function(input, output) {
  
  output$plot_1 <- renderPlot({
    options(scipen=10000)
    
    chat_1_data <- heart_df %>%
      filter(country == input$age_type)
    
    heart_plot <- ggplot(chart_1_df) +
      geom_point(mapping = aes(x = input$age_type, y = RestingBP)) +
      labs(x = input$age_type, "vs", y = "Resting BP", title = "Age Vs Resting BP")
    
  })
  
}