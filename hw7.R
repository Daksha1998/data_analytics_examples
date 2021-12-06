#install.packages("shinydashboard")
# install.packages("ggplot2")
# library(shinydashboard)
# library(data.table)
# 
# data.table::data.table(iris)
library(plyr)
library(shiny)
library(shinythemes)

names(iris)

ui <- fluidpage
(
  titlePanel("Iris Dataset"),
  h1("drop to change color the group and slide to chnage the bins"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "bins",
        label = "number of bins",
        min = 1,
        max = 100,
        value = 40),
      
      selectInput(inputId ="colors",label = "Choose color from it ", choices =c("Pink","green","black"),
                  selected = "Pink", multiple = F),
    ),
    
    mainPanel(
      plotOutput(outputId = "LenPlot"),
      plotOutput(outputId = "WidthPlot")
    )
  )
)
Server<-function(input,output)
{
  output$LenPlot <- renderPlot
  (
    {
      if(input$colors=="Pink"){
        sColor = "#ff3300"
      }else if(inpuy$colors=="green"){
        sColor = "#66ff33"
      }else if(input$colors=="black"){
        sColor= "3399ff"
      }
      
      x<-iris$Petal.Length
      bin<-seq(min(x),max(x),length.out = input$bins + 1)
      plot_1 <- hist(x, breaks = bin, col = sColor, border = "white", 
                     xlab=  "length in CM",
                     main = "Histogram for iris data using the petal length ")
      plot_1
    })
  
  output$widthPlot <- renderPlot
  (
    #switch(input$dataset
    {
      if(input$colors=="Pink"){
        sColor = "#ff3300"
      }else if(inpuy$colors=="green"){
        sColor = "#66ff33"
      }else if(input$colors=="black"){
        sColor= "3399ff"
      }
      
      x<-iris$Petal.Width
      bin<-seq(min(x),max(x),length.out = input$bins + 1)
      plot_2 <- hist(x, breaks = bin, col = sColor, border = "white", 
                     xlab = "length in CM",
                     main = "Histogram for iris data using the petal Width ")
      plot_2
    })
  
}
shinyApp(ui, server)


