library(shiny)

# Define UI ----
ui <- navbarPage("Final Deliverable",
                 
                 
                 tabPanel("Introduction",
                          h1("Summary"  ,  style = "color: rgb(178,57,61)"),
                          p("Health is an essential part of every being and it's important that we humans know 
                            how to keep ourselves healthy as good health is critical for one's happieness and well-being. 
                            Health is imporatnt as it is essential for keeping our bodies alive and working. 
                            This projects goal is to better understand how"),
                          h1("Page Description", style = "color: rgb(178,57,61)"),
                          p("The chart 1 tab is an interactive slider that allows you to filter a range of age groups that shows 
                            the resting blood pressure for that rage af ages. This tab explains how the age of a person effects the 
                            resting blood pressure of the human body?" ,
                            style = "color: rgb(41,41,41)"),
                          p("The chart 2 tab allows the user to input their age and sex and will return the average resting blood pressure, 
                            cholesterol, and max heart rate between those who do and don't have a heart diesease. 
                            This tab explains how does the average resting blood pressure, cholesterol, and max heart rate differ between those who 
                            do and don't have a heart disease?" ,
                            style = "color: rgb(41,41,41)"),
                          p("The chart 3 tab allows the user to choose the pain type and what they want to compare it to and will be shown a bar chart 
                            of their selection. This tabe explains how the different types of chest pain (ASY, ATA, NAP, TA) effect the average cholesterol in a person?" ,
                            style = "color: rgb(41,41,41)")
                          ),
                 
                 # CHART 1 PANEL
                 tabPanel(
                   "Scatter Plot",
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
                       p("This graph allows users to compare age to health topics (Resting Blood Pressure or Cholesterol) to demonstrate the correlation 
                         between the two. Users can input their age as well as what health topics they want to analyze. By using a scatter plot, it is easier 
                         for the viewer to visualize the distribution of Resting Blood Pressure or Cholesterol among the different ages."),
                       plotlyOutput("plot_1"),
                       h1("Any correlations or noticeable difference within this graph?"),
                       p("From the graph, you can see that as you get older there is no noticeable difference 
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
                   "Box Plot",
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
                       p("This box plots shows the distribution of each sex's (Male/Female) distribution of different
                         health characteristics. The user can choose which sex and category they want to display, for example,
                         they can show the male distribution of cholesterol. From this they can see where they fall along compared to out data and
                         see how different sexes have different health distrubutions.",
                         style = "color: Blue" ),
                       plotlyOutput("plot_2"),
                       h3("So... what does this distribution tell us?"),
                       p("For cholesterol levels and resting heart rate, males tend to have a slighlty higher median than females. 
                         However, the median heart rate for males is slightly lower than females. It is also worth noting that
                         males have more variation since there are more outliers in the male distrubtions for all three variables." ,
                         style = "color: Red")
                     )
                   )
                 ), #END OF CHART 2 PANEL
                 
                 # CHART 3 PANEL
                 tabPanel(
                   "Bar Chart",
                   sidebarLayout(
                     sidebarPanel(
                       selectizeInput(
                         inputId = "category_chart_3",
                         label = "Select a category",
                         choices = c("Average Cholesterol",
                                     "Average Resting Blood Pressure",
                                     "Number of People"),
                         multiple = FALSE),
                       h3("Codebook"),
                       p("ASY = Asymptomatic", style = "color: rgb(0,168,0)"),
                       p("ATA = Atypical Non-Angina", style = "color: rgb(255,178,36)"),
                       p("NAP = Non-Anginal", style = "color: rgb(255,178,36)"),
                       p("TA = Typical Angina", style = "color: rgb(255,36,36)")
                     ),
                     mainPanel(
                       p("This bar graph reveals different health information about people who have different types of Angina,
                         also known as, chest pain. Users can choose different health characteristics as well as the number of people
                         within each category to see how it is distrubuted and what the average health characteristics each type of 
                         Angina has. This allows the users to see how the different types of Angina differ and how health characteristics
                         influence each type.",
                         style = "color: rgb(178,57,61)"),
                       plotlyOutput("plot_3"),
                       h1("Analyzed..."),
                       p("The findings show that the different types of heart pain have relatively similar average cholesterol 
                         levels as well average resting blood pressures. However, there is significantly more people that have 
                         the ASY pain type. Specifically, ASY has roughy 2.5 times the number cases than ATA or NAP. Lastly, 
                         the TA pain type is the least likely to occur with less than half the number of cases as NAP." ,
                         style = "color: Green")
                     )
                   )
                  ), # END OF CHART 3 PANEL
                 
                 
                 tabPanel("Summary",
                          h1("Major Takeaways"),
                          p("")),
)




