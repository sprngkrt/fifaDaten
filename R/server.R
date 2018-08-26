
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


teams <- data %>%
  distinct(Mannschaft)


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

}

