


pageWithSidebar(
  headerPanel('Iris k-means clustering'),
  sidebarPanel(
    selectInput("man1", "Mannschaft 1: ", teams, selected = "Germany"),
    selectInput("man2", "Mannschaft 2: ", teams, selected = "England") ),

  mainPanel(
    plotOutput("plot1")
  )
)
