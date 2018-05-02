ui <- fluidPage(
  
  titlePanel("Predicting Flower Species"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("sepal.length", 
                  label = "Sepal Length:",
                  min = 3,
                  max = 8,
                  value = 4,
                  step = .1),
      sliderInput("sepal.width", 
                  label = "Sepal Width:",
                  min = 2,
                  max = 8,
                  value = 3,
                  step = .1),
      sliderInput("petal.length", 
                  label = "Petal Length:",
                  min = 1,
                  max = 8,
                  value = 2,
                  step = .1),
      sliderInput("petal.width", 
                  label = "Petal Width:",
                  min = 0.1,
                  max = 5,
                  value = 0.5,
                  step = .1)
      
    ),
    

    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("ScatterPlot", plotOutput("scatterplot")),
                  tabPanel("DensityPlot", plotOutput("densityplot")),
                  tabPanel("Table", dataTableOutput("table"))
      )
    )
  )
)

