ImportData <- function(path){

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


}

