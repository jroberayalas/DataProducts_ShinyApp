
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Mauna Loa Atmospheric CO2 Concentration Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        h3("Mode of Use"),
        p("The following is a simple shiny app that allows the user to visualize the Mauna Loa 
          Atmospheric CO2 Concentration from 1959 to 1997."),
        sliderInput("year", 
                    label = h3("Year"),
                    min = 1959, 
                    max = 1996, 
                    value = 1959,
                    step = 1),
        numericInput("horizon", 
                     label = h3("Horizon"), 
                     value = 1,
                     min = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("predictionPlot")
    )
  )
))
