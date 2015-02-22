
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
          Atmospheric CO2 Concentration from 1959 to 1997 and make predictions about the concentration
          in future years."),
        sliderInput("year", 
                    label = h3("Year"),
                    min = 1959, 
                    max = 1996, 
                    value = 1990,
                    step = 1),
        helpText("This parameter establishes the start year that will be considered to
                 fit a prediction model. The final year is always 1997. Everytime this
                 parameter is changed, a new model is fitted. NOTE: It can take some
                 seconds to fit the model."),
        numericInput("horizon", 
                     label = h3("Horizon"), 
                     min = 1,
                     value = 20),
        helpText("This parameter establishes how many years into the future the model
                 shall be used to make predictions. Everytime this parameter is changed,
                 the plot is updated. NOTE: Minimum value is 1.")
    
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("predictionPlot")
    )
  )
))
