
server <- function(input, output) {
  
output$table <- DT::renderDataTable({
     genPreds(
      Sepal.Length = input$sepal.length,
      Sepal.Width = input$sepal.width,
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width
    ) %>%
      datatable() %>%
      formatPercentage(columns = "preds", digits =2)
   
  })
  
output$scatterplot <- renderPlot({
   ggplot(data = Iris)+
      geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species))+
      geom_point(aes(x = input$sepal.length, y = input$sepal.width, size = 4, color = "red"))+
    theme(legend.position = "none")
})

  output$densityplot <- renderPlot({
    p1 <- ggplot(data = Iris, aes(x = Sepal.Length, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      geom_vline(aes(xintercept = input$sepal.length, color = "red"))+
      xlab("Sepal Length")+
      theme(legend.position = "none")
    p2 <- ggplot(data = Iris, aes(x = Sepal.Width, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      geom_vline(aes(xintercept = input$sepal.width, color = "red"))+
      theme(legend.position = "none")
    p3 <- ggplot(data = Iris, aes(x = Petal.Length, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      geom_vline(aes(xintercept = input$petal.length, color = "red"))+
      theme(legend.position = "none")
    p4 <- ggplot(data = Iris, aes(x = Petal.Width, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      geom_vline(aes(xintercept = input$petal.width, color = "red"))+
      theme(legend.position = c(0,1))
    grid.arrange(p1, p2,p3, p4, ncol = 2)
    
  })
}

  