
teams <- sort(unique(data$Mannschaft))

pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput("man1", "Mannschaft 1: ", teams, selected = "Germany"),
    selectInput("man2", "Mannschaft 2: ", teams, selected = "England"),
    sliderInput("jahr", "Zeitraum", 1872, 2014, value = c(1950, 2014))),

  mainPanel(
    plotOutput("plot1")
  #  plotOutput("plot2")
  )
)
