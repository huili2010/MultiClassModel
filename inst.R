library(xgboost)
library(tidyverse)
Iris <- iris
y0 <- Iris$Species
var.levels <- levels(y0)
y <- as.integer(y0) - 1

Exp <- Iris[,-5]
x <- Exp[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
var.names <- names(x)
x = as.matrix(x)

params <- list(
  "objective" = "multi:softprob"
  ,"eval_metric" = "mlogloss"
  ,"num_class" = length(table(y))
  ,"eta" = 0.25
  ,"max_depth" = 3
)
cv.nround = 125
IrisClass<- xgboost(param = params, data = x, label  = y,
                        nrounds = cv.nround, missing  = NA)
xgb.importance(var.names, model = IrisClass)

xgb.save(IrisClass, "iris.model")

IrisClassInfo <- list(
  var.names = var.names
  ,var.levels = var.levels
)

save(IrisClassInfo, file = 'IrisClassInfo.rda')
