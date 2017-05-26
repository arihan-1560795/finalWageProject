library(dplyr)
library(plotly)
library(shiny)

#Read data file here

shinyServer(function(input, output) { 
  output$GraphName <- renderPlotly({
    #process information here
    return(plot_ly(
      #Graph data here (data = a, x = b, ...)
    ))
  })
})