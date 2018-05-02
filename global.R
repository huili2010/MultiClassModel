library(shiny)
library(tidyverse)
library(ggplot2)
library(DT)
library(grid)
library(gridExtra)

# Gen Predictions #

genPreds <- function(Sepal.Length = 5, Sepal.Width = 3, Petal.Length = 1.5, Petal.Width = 0.2){
  
  testDF <- data.frame(Sepal.Length = Sepal.Length,Sepal.Width = Sepal.Width, Petal.Length = Petal.Length, Petal.Width = Petal.Width)
  
  preds <- predict(IrisClass, as.matrix(testDF))
  
  
  data.frame(
    Species = var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
}