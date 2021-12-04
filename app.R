library(shiny)
library(dplyr)
library(ggplot2)

<<<<<<< HEAD
=======
# Define UI ----
ui <- navbarPage("INFO Project",
                 tabPanel("Introduction",
                          h1("Summary"),
                          p("Health is an essential part of every being and it's important that we humans know how to keep ourselves healthy as good health is critical for one's happieness and well-being. Health is imporatnt as it is essential for keeping our bodies alive and working. This projects goal is to better understand how ")),
                 tabPanel("Chart 1"),
                 tabPanel("Chart 2"),
                 tabPanel("Chart 3"),
                 tabPanel("Summary",
                          p("")),
)
                 
>>>>>>> 43ec742e1c33ef9ac5b784a34fd211d0b437758a

source("ui.R")
source("server.R")

shinyApp(ui, server)