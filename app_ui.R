library(shiny)

# Define UI ----
ui <- navbarPage("Final Deliverable",
                 
                 
                 tabPanel("Introduction",
                          h1("Summary"  ,  style = "color: Yellow"),
                          h2("Health is an essential part of every being and it's important that we humans know how to keep ourselves healthy as good health is critical for one's happieness and well-being. Health is imporatnt as it is essential for keeping our bodies alive and working. This projects goal is to better understand how"),
                          h1("Page Description"),
                          h2("The chart 1 tab is an interactive slider that allows you to filter a range of age groups that shows the resting blood pressure for that rage af ages. This tab explains how the age of a person effects the resting blood pressure of the human body?" ,  style = "color: Orange"),
                          h2("The chart 2 tab allows the user to input their age and sex and will return the average resting blood pressure, cholesterol, and max heart rate between those who do and don't have a heart diesease. This tab explains how does the average resting blood pressure, cholesterol, and max heart rate differ between those who do and don't have a heart disease?" ,  style = "color: Orange"),
                          h2("The chart 3 tab allows the user to choose the pain type and what they want to compare it to and will be shown a bar chart of their selection. This tabe explains how the different types of chest pain (ASY, ATA, NAP, TA) effect the average cholesterol in a person?" ,  style = "color: Orange")
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
                         value = c(min(heart_df$Age), max(heart_df$Age)),
                         step = 1
                       ),
                       selectizeInput(
                         inputId = "category_chart",
                         label = "Select a category",
                         choices = c("Resting Blood Pressure", "Cholesterol"),
                         multiple = FALSE
                       )

                     ),
                     mainPanel(
                       h1("Scatter Plot Comparing Age to Resting Blood Pressure or Age to Cholesterol"),
                       h2("This graph allows users to compare age to health topics (Resting Blood Pressure or Cholesterol) to demonstrate the correlation between the two. Users are able to input their age as well as what health topics they want to analyze. By using a scatter plot, it is easier for the viewer to visualize the distribution of Resting Blood Pressure or Cholesterol among the different ages."),
                       plotlyOutput("plot_1"),
                       h1("Any correlations or noticeable difference within this graph?"),
                       h2("From the graph, you can see that as you get older there is no noticeable difference 
                         between the resting bp and the age with an exception of 
                         an outlier at the age of 55 where the resting bp is 0. 
                         When analyzing Age vs Cholesterol, the distribution of 
                         Cholesterol level across the different Ages there is no 
                         noticeable difference but as you get older the datapoints 
                         is more spread out. Therefore As age increases, there is more
                          variation in cholesterol levels than resting blood pressure.")
                       
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
                       h1("Bar Plot Comparing different "),
                       p(),
                       plotlyOutput("plot_2"),
                       h2("This is a vertical box and whiskers plot that shows the distriubtion 
                          for the user's selected variable. In addition, users can select the 
                          distribution of either males or females." ,  style = "color: Blue" ),
                       h2(),
                       h2(),
                       h1("So... what does this distribution tell us?"),
                       h2("For cholesterol levels and resting heart rate, males tend to have a slighlty higher median than females. 
                         However, the median heart rate for males is slightly lower than females. It is also worth noting that
                         males have more variation since there are more outliers in the male distrubtions for all three variables." ,  style = "color: Red")
                     )
                   )
                 ), #END OF CHART 2 PANEL
                 
                 
                 tabPanel(
                   "Chart 3",
                   sidebarLayout(
                     sidebarPanel(
                       selectizeInput(
                         inputId = "category_chart_3",
                         label = "Select a category",
                         choices = c("Average Cholesterol",
                                     "Average Resting Blood Pressure",
                                     "Number of People"),
                         multiple = FALSE)
                     ),
                     mainPanel(
                       plotlyOutput("plot_3"),
                       h1("ASY = This bar graph compares the different types of heart pain to the variable that the user selects." ,  style = "color: Pink"),
                       h1(),
                       h1("Analyzed..."),
                       h2("The findings show that the different types of heart pain have relatively similar average cholesterol 
                         levels as well average resting blood pressures. However, there is significantly more people that have 
                         the ASY pain type. Specifically, ASY has roughy 2.5 times the number cases than ATA or NAP. Lastly, 
                         the TA pain type is the least likely to occur with less than half the number of cases as NAP." ,  style = "color: Green")
                     )
                   )
                  ),
                 
                 
                 tabPanel("Summary",
                          h1("Major Takeaways"),
                          p("")),
)




