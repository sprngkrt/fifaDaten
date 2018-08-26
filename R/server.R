
rm(list =ls())


library(shiny)
library(dplyr)
library(countrycode)

path <- "C:/Arbeitsordner/R/fifaDaten/data/results.csv"


rawData <- read.csv(path)

rawData <- rawData %>%
  mutate(date = as.Date(date, format = "%Y-%m-%d"))

#couCon <- codelist %>%
#  select(country.name.en, continent)



home <- rawData
colnames(home) <- c("date", "Mannschaft", "Gegner", "Tore", "Gegentore", "Tunier", "Stadt", "Land")
home$heim <- 1


away <- rawData
colnames(away) <- c("date", "Gegner", "Mannschaft", "Gegentore",  "Tore", "Tunier", "Stadt", "Land")
away$heim <- 0

data <- union(home, away)

#couCon <- codelist %>%
#  select(country.name.en, continent)



function(input, output, session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })

}
