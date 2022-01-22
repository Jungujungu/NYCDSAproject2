#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram

df <- read.csv(file="./df_for_shiny.csv")
categorical = c('fuel', 'transmission', 'seller_type', 'owner')

shinyServer(function(input, output) {
    output$corr <- renderPlot(
      if (input$feature %in% categorical) {
        ggplot(df, aes_string(x = input$feature, y = log(df$selling_price), fill = input$feature)) +
        geom_boxplot() +
        ggtitle("correlation to selling price")
      }
      else
        ggplot(df, aes_string(x = input$feature, y = log(df$selling_price))) +
        geom_point() +
        ggtitle("correlation to selling price")
      
    )

})
