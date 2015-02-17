library(caret)
library(ggplot2)

train <- read.csv("pml-training.csv", sep=",", quote="\"")
test <- read.csv("pml-testing.csv", sep=",", quote="\"")

model <- train(classe ~ ., method="rpart", data=train)