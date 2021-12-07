library(shiny)

# Define UI ----
ui <- navbarPage("Final Deliverable",
                 
                 
                 tabPanel("Introduction",
                          h1("Summary"),
                          p("Health is an essential part of every being and it's important that we humans know how to keep ourselves healthy as good health is critical for one's happieness and well-being. Health is imporatnt as it is essential for keeping our bodies alive and working. This projects goal is to better understand how"),
                          h2("Page Description"),
                          p("The chart 1 tab is an interactive slider that allows you to filter a range of age groups that shows the resting blood pressure for that rage af ages. This tab explains how the age of a person effects the resting blood pressure of the human body?"),
                          p("The chart 2 tab allows the user to input their age and sex and will return the average resting blood pressure, cholesterol, and max heart rate between those who do and don't have a heart diesease. This tab explains how does the average resting blood pressure, cholesterol, and max heart rate differ between those who do and don't have a heart disease?"),
                          p("The chart 3 tab allows the user to choose the pain type and what they want to compare it to and will be shown a bar chart of their selection. This tabe explains how the different types of chest pain (ASY, ATA, NAP, TA) effect the average cholesterol in a person?")
                          ),
                 
                 # CHART 1 PANEL
                 tabPanel(
                   "Chart 1",
                   sidebarLayout(
                     sidebarPanel(
                       sliderInput(
                         inputId = "age_range",
                         label = " Input Age Range",
                         min = min(heart_df$Age),
                         max = max(heart_df$Age),
                         value = c(min(heart_df$Age), max(heart_df$Age))
                       ),
                       selectizeInput(
                         inputId = "category_chart",
                         label = "Select a category",
                         choices = c("Age", "Resting Blood Pressure", "Cholesterol"),
                         multiple = FALSE
                       )

                     ),
                     mainPanel(
                       plotOutput("plot_1"),
                       p("This is why...")
                       
                     )
                   )
                 ), # END OF CHART 1
                 
                 # CHART 2 PANEL
                 tabPanel(
                   "Chart 2",
                   sidebarLayout(
                     sidebarPanel(
                       selectInput(
                         inputId = "sex",
                         label = "Select a sex to compare", 
                         choices = c("M", "F")
                       ),
                       selectizeInput(
                         inputId = "category_chart_2",
                         label = "Select a category",
                         choices = c("Cholesterol",
                                     "Resting Blood Pressure", "Max Heart Rate"),
                         multiple = FALSE
                       )
                     ),
                     mainPanel(
                       plotOutput("plot_2")
                     )
                   )
                 ), #END OF CHART 2 PANEL
                 
                 
                 tabPanel("Chart 3"),
                 
                 
                 tabPanel("Summary",
                          h1("Major Takeaways"),
                          p("")),
)




