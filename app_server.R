

heart_df <- read.csv("heart.csv")

cat_chart_1 <- heart_df %>%
  select(RestingBP, Cholesterol) %>%
  unique()

# Define server logic ----
server <- function(input, output) {
  
# CHART 1 - HUNG

  
  output$plot_1 <- renderPlotly({
    plot_data <- heart_df %>%
      select(Age, RestingBP, Cholesterol)
    
    colnames(plot_data) <- c("Age", "Resting Blood Pressure", "Cholesterol")
    
    options(scipen=10000)
    
    heart_data <- plot_data %>%
      filter(Age >= input$age_range[1] & Age <= input$age_range[2])
    
    ggplot(heart_data) +
      geom_point(aes(x = Age, y = .data[[input$category_chart]])) +
      labs(title = paste(input$age_range, "vs", input$category_chart), 
           # so age_range has two outputs causing a warning, i think just Age vs Category should be fine
           x = "Age", 
           y = input$category_chart)
  })

# CHART 2 - MATTHEW
  output$plot_2 <- renderPlotly({
    plot_2_data <- heart_df %>%
      select(Sex, Cholesterol, RestingBP, MaxHR)
    
    colnames(plot_2_data) <- c("Sex", "Cholesterol",
                               "Resting Blood Pressure", "Max Heart Rate")
    plot_2_data <- plot_2_data %>%
      filter(Sex == input$sex)
    
    plot_2_title <- sprintf("Sex's distribution of %s", input$category_chart_2)
    
    ggplot(plot_2_data) +
      geom_boxplot(aes(x = Sex,
                       y = .data[[input$category_chart_2]])) +
      labs(title = plot_2_title,
           x = "Sex",
           y = input$category_chart_2)
  })
  
# CHART 3 - JADEN
  output$plot_3 <- renderPlotly({
    plot_3_data <- heart_df %>%
      group_by(ChestPainType) %>%
      summarise(avgCholesterol = mean(Cholesterol),
                avgRestingBP = mean(RestingBP),
                count = n())
    
    colnames(plot_3_data) <- c("ChestPainType",
                               "Average Cholesterol",
                               "Average Resting Blood Pressure",
                               "Number of People")
    plot_3_title <- sprintf("Chest Pain Type Distribution of %s", 
                            input$category_chart_3)
    
    ggplot(plot_3_data) +
      geom_bar(aes(x = ChestPainType, y = .data[[input$category_chart_3]]),
               stat = "identity",
               width=0.35) +
      labs(title = plot_3_title,
           x = "Chest Pain Type")
    
    
  })
}