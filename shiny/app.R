library(shiny)
bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)
print(str(bcl))
ui <- fluidPage(title = "First Shiny app","BC Liquor Store", "prices")
server <- function(input, output) {}
shinyApp(ui = ui, server = server)
