#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram

df <- read.csv(file="./df_for_shiny.csv")

shinyUI(fluidPage(

    # Application title
    titlePanel("Used car price feature correlation"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectizeInput(inputId = 'feature',
                           label = 'feature',
                           choices = colnames(df[,-c(2)]))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("corr")
        )
    )
))
