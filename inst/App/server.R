rm(list = ls())

library(shiny)
library(dplyr)
library(countrycode)

getwd()
source("R/ImportData.R")

ImportData("extdata/results.csv")


teams <- sort(unique(data$Mannschaft))


data$Ergebnis <- data %>%
  if_else("Tore" == Gegentore, "Sieg",  if_else(Tore < Gegentore, "Niederlage", "Unentschieden"))

function(input, output, session) {


  # Combine the selected variables into a new data frame
  Spiele <- reactive({
    data %>%
     filter(Mannschaft == input$man1,
            Gegner == input$man2) %>%
    select (Tore, Gegentore)
  })

  output$plot1 <- renderPlot({
    plot(Spiele())
  })


  Ergebnisse <- reactive({
    Spiele() %>%
      select("Ergebnis") %>%
      table()
  })

    output$plot2 <- renderTable({
      Ergebnisse()
      })
}

