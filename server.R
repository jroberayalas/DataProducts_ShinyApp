
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(forecast)

shinyServer(function(input, output) {
  
    model <- reactive({
        # create model
        fit <- auto.arima(window(co2, start = input$year))
    })
    
  output$predictionPlot <- renderPlot({

    # draw the histogram with the specified number of bins
    plot(forecast(model(), h = input$horizon),
         xlab = "Year",
         ylab = "CO2 Concentration [ppm]",
         main = "Mauna Loa Atmospheric CO2 Concentration")
    legend(x = "topleft",
           legend = c("Time Series", "Prediction"),
           lty = c(1, 1),
           lwd = c(1, 2),
           col = c("black", "blue"))

  })

})
