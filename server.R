

library(shiny)
library(datasets)

mpgData <- mtcars

shinyServer(function(input, output) {
  
  inputPanel(
    selectInput("n_breaks", label = "Number of bins:",
                choices = c(5, 10, 20, 30), selected = 20),
    
    sliderInput("bw_adjust", label = "Bandwidth adjustment:",
                min = 0.2, max = 2, value = 1, step = 0.2)
  )
  
  renderPlot({
    hist(mtcars$mpg, probability = TRUE, breaks = as.numeric(input$n_breaks),
         xlab = "MPG", main = "MPG of Cars")
    
    dens <- density(mtcars$mpg, adjust = input$bw_adjust)
    lines(dens, col = "green")
  })
})