library(caret)
library(ggplot2)

train <- read.csv("pml-training.csv", sep=",", quote="\"")
test <- read.csv("pml-testing.csv", sep=",", quote="\"")

model <- train(classe ~ ., method="rpart", data=train)

# explore
pred <- predict(model, test)
confusionMatrix(pred, test$classe)
# etc, see http://www.edii.uclm.es/~useR-2013/Tutorials/kuhn/user_caret_2up.pdf
