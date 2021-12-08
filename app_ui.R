library(shiny)

# Define UI ----
ui <- navbarPage("Final Deliverable",
                 tabPanel(
                   "Introduction",
                   sidebarLayout(
                     sidebarPanel(
                       tags$img(src="https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/rise_above_heart_failure_slideshow/1800ss_getty_rf_heart.jpg?resize=650px:*", height="100%", width="100%", align="right"),
                     ),
                     mainPanel(
                       h1("Summary"  ,  style = "color: rgb(178,57,61)"),
                       p("The overarching theme for this analysis is health. While in the midst of a pandemic, it’s crucial to understand how 
                       to effectively maintain one’s health and analyzing trends in health data sets can help individuals with this. These data 
                       sets provides insight into both physical and mental health as well as other health topics. The data sets chosen focus on 
                       health related factors such as mental health, Covid/diet, and heart disease. These data sets can be utilized in order to 
                       answer questions such as is there correlations between age and cholesterol levels. In this case, the graphs created were 
                       primarily derived from the heart data set."),
                       p("For this project, we decided to focus on heart disease as cardiovascular diseases (CVDs) are the number 1 cause of 
                         death globally, taking an estimated 17.9 million lives each year. This dataset is made to help people with CVD help 
                         patients know if they have Cardiovascular disease before it’s too late. Data was collected by combining 5 different 
                         datasets which were Cleveland, Hungarian, Switzerland, Long Beach VA, Stalog (Heart) Data Set. In total there are 918 
                         observations and 12 features in the dataset."),
                       h1("Chart Outline", style = "color: rgb(178,57,61)"),
                       p("The scatter plot tab is an interactive slider that allows you to filter a range of age groups that shows 
                            the resting blood pressure for that rage af ages. This tab explains how the age of a person effects the 
                            resting blood pressure of the human body?" ,
                         style = "color: rgb(41,41,41)"),
                       p("The box plot tab allows the user to input their age and sex and will return the average resting blood pressure, 
                            cholesterol, and max heart rate between those who do and don't have a heart diesease. 
                            This tab explains how does the average resting blood pressure, cholesterol, and max heart rate differ between those who 
                            do and don't have a heart disease?" ,
                         style = "color: rgb(41,41,41)"),
                       p("The bar chart tab allows the user to choose the pain type and what they want to compare it to and will be shown a bar chart 
                            of their selection. This tabe explains how the different types of chest pain (ASY, ATA, NAP, TA) effect the average cholesterol in a person?" ,
                         style = "color: rgb(41,41,41)")
                     )
                   )
                 ),
                 
                 # tabPanel("Introduction",
                 #          h1("Summary"  ,  style = "color: rgb(178,57,61)"),
                 #          p("Health is an essential part of every being and it's important that we humans know 
                 #            how to keep ourselves healthy as good health is critical for one's happieness and well-being. 
                 #            Health is imporatnt as it is essential for keeping our bodies alive and working. 
                 #            This projects goal is to better understand how"),
                 #          h1("Chart Outline", style = "color: rgb(178,57,61)"),
                 #          p("The scatter plot tab is an interactive slider that allows you to filter a range of age groups that shows 
                 #            the resting blood pressure for that rage af ages. This tab explains how the age of a person effects the 
                 #            resting blood pressure of the human body?" ,
                 #            style = "color: rgb(41,41,41)"),
                 #          p("The box plot tab allows the user to input their age and sex and will return the average resting blood pressure, 
                 #            cholesterol, and max heart rate between those who do and don't have a heart diesease. 
                 #            This tab explains how does the average resting blood pressure, cholesterol, and max heart rate differ between those who 
                 #            do and don't have a heart disease?" ,
                 #            style = "color: rgb(41,41,41)"),
                 #          p("The bar chart tab allows the user to choose the pain type and what they want to compare it to and will be shown a bar chart 
                 #            of their selection. This tabe explains how the different types of chest pain (ASY, ATA, NAP, TA) effect the average cholesterol in a person?" ,
                 #            style = "color: rgb(41,41,41)")
                 #          ),
                 
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
                       h2("Scatter Plot Comparing Age to Resting Blood Pressure or Age to Cholesterol"),
                       p("This graph allows users to compare age to health topics (Resting Blood Pressure or Cholesterol) to demonstrate the correlation 
                         between the two. Users can input their age as well as what health topics they want to analyze. By using a scatter plot, it is easier 
                         for the viewer to visualize the distribution of Resting Blood Pressure or Cholesterol among the different ages."),
                       plotlyOutput("plot_1"),
                       h3("Any correlations or noticeable difference within this graph?"),
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
                       h2("Distribution of Health Characteristics by Sex"),
                       p("This box plots shows the distribution of each sex's (Male/Female) distribution of different
                         health characteristics. The user can choose which sex and category they want to display, for example,
                         they can show the male distribution of cholesterol. From this they can see where they fall along compared to out data and
                         see how different sexes have different health distrubutions.",
                         style = "color: Blue" ),
                       plotlyOutput("plot_2"),
                       h3("So... what does this distribution tell us?"),
                       p("For cholesterol levels and resting heart rate, females tend to have a slighlty higher median than males. 
                         However, the median max heart rate is equal for males and females. It is also worth noting that
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
                       h2("Health Characteristics for Different Types of Angina"),
                       p("This bar graph reveals different health information about people who have different types of Angina,
                         also known as, chest pain. Users can choose different health characteristics as well as the number of people
                         within each category to see how it is distrubuted and what the average health characteristics each type of 
                         Angina has. This allows the users to see how the different types of Angina differ and how health characteristics
                         influence each type.",
                         style = "color: rgb(178,57,61)"),
                       plotlyOutput("plot_3"),
                       h3("Analyzed..."),
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
                          h3("Scatter Plot Comparing Age to Resting Blood Pressure or Age to Cholesterol"),
                          p("From our interactive scatter plot, we found that there was no noticeable correlation between the age of a person and their resting blood pressure or cholesterol level. The scatter plot allowed the user to input the age range they would like to examine and then choose the variable they would like to compare it to (resting blood pressure or cholesterol). The scatterplot is useful in this situation as it allows the user to visualize the ranges of the variable they chose for each age and can easily see if there is or isn’t a correlation between age and the variable."),
                          h3("Distribution of Health Characteristics by Sex"),
                          p("From our interactive box plot, we are able to find the median, first quartile, third quartile, minimum, maximum, and any outliers. The boxplot showed us that Females have a higher median resting heart rate and cholesterol levels than males. We also found that the median max heart rate for males and females is equal. The box plot also showed us that males tended to have more variation as there were more male outliers than females."),
                          h3("Health Characteristics for Different Types of Angina"),
                          p("From our interactive bar chart, we are able to choose a category (average cholesterol, average resting blood pressure, number of people) and compare it between the four different angina types (ASY, ATA, NAP, TA). We found that the chest pain type with the highest average cholesterol is ATA, the chest pain type with the highest average resting blood pressure is TA, the chest pain type with the highest number of people is ASY. Overall the differences between the pain type for the average cholesterol and resting blood pressure are quite similar, but significantly more people have ASY chest pains.")
                          ),
)




