library(shiny)

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
                 

navbarPage("INFO Project",
           tabPanel("Plot"),
           navbarMenu("More",
                      tabPanel("Summary"),
                      "----",
                      "Section header",
                      tabPanel("Table")
           )
)

# Define server logic ----
server <- function(input, output) {

}

# Run the app ----
shinyApp(ui = ui, server = server)
