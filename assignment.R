# Assignment for Practical Machine Learning - Coursera John Hopkins

library(caret)
library(ggplot2)

# Read the datasets. Outside of R, I've cleaned them by removing the quote characters and 
# changed the Excel DIV/0 entries to NA.
sampleset <- read.csv("pml-training.csv", sep=",")
# special treatment for columns that it thinks are factors
sampleset$X <- as.numeric(sampleset$X)
testset <- read.csv("pml-testing.csv", sep=",",colClasses=lapply(sampleset,class))

# Split train set into train and validation
inTrain <- createDataPartition(y=sampleset$classe,p=0.6,list=F)
trainset <- sampleset[inTrain,]
print("Omitting rows and cols for training set:")
print(dim(trainset))
trainset <- subset(trainset, select = c(new_window,num_window,roll_belt,pitch_belt,yaw_belt,total_accel_belt,
                                        gyros_belt_x,gyros_belt_y,gyros_belt_z,accel_belt_x,accel_belt_y,accel_belt_z,magnet_belt_x,magnet_belt_y,magnet_belt_z,roll_arm,pitch_arm,yaw_arm,total_accel_arm,
                                        gyros_arm_x,gyros_arm_y,gyros_arm_z,accel_arm_x,accel_arm_y,accel_arm_z,magnet_arm_x,magnet_arm_y,magnet_arm_z,
                                        roll_dumbbell,pitch_dumbbell,yaw_dumbbell,total_accel_dumbbell,
                                        gyros_dumbbell_x,gyros_dumbbell_y,gyros_dumbbell_z,accel_dumbbell_x,accel_dumbbell_y,accel_dumbbell_z,magnet_dumbbell_x,magnet_dumbbell_y,magnet_dumbbell_z,roll_forearm,pitch_forearm,yaw_forearm,
                                        gyros_forearm_x,gyros_forearm_y,gyros_forearm_z,accel_forearm_x,accel_forearm_y,accel_forearm_z,magnet_forearm_x,magnet_forearm_y,magnet_forearm_z,classe))
# also leave out a few rows with NA's
# perhaps we should consider knn preprocessing to infer the missing values instead
trainset <- na.omit(trainset)
print(dim(trainset))

valset <- sampleset[-inTrain,]
# same for the validation set
print("Omitting rows and cols for validation set:")
print(dim(valset))
valset <- subset(valset, select = c(new_window,num_window,roll_belt,pitch_belt,yaw_belt,total_accel_belt,
                                        gyros_belt_x,gyros_belt_y,gyros_belt_z,accel_belt_x,accel_belt_y,accel_belt_z,magnet_belt_x,magnet_belt_y,magnet_belt_z,roll_arm,pitch_arm,yaw_arm,total_accel_arm,
                                        gyros_arm_x,gyros_arm_y,gyros_arm_z,accel_arm_x,accel_arm_y,accel_arm_z,magnet_arm_x,magnet_arm_y,magnet_arm_z,
                                        roll_dumbbell,pitch_dumbbell,yaw_dumbbell,total_accel_dumbbell,
                                        gyros_dumbbell_x,gyros_dumbbell_y,gyros_dumbbell_z,accel_dumbbell_x,accel_dumbbell_y,accel_dumbbell_z,magnet_dumbbell_x,magnet_dumbbell_y,magnet_dumbbell_z,roll_forearm,pitch_forearm,yaw_forearm,
                                        gyros_forearm_x,gyros_forearm_y,gyros_forearm_z,accel_forearm_x,accel_forearm_y,accel_forearm_z,magnet_forearm_x,magnet_forearm_y,magnet_forearm_z,classe))
valset <- na.omit(valset)
print(dim(valset))

# create model - takes a long time even on a pretty fast computer
model <- train(classe ~ ., method="treebag", data=trainset)
preds <- predict(model, newdata=valset)

# explore results
print(table(preds, valset$classe))
# number of times we're right - indication for out of sample error
print(sum(preds == valset$classe) / length(preds))


