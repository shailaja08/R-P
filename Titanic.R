
## Set working directory
setwd("C:\\Users\\412491\\Desktop\\Titanic")
getwd()

## Installed "caret" package and the "randomForest" package
## Loading packages
library(caret)
library(randomForest)

## Read data Train and Test CSV to R
trainSet <- read.csv("train.csv",header = TRUE)
testSet <- read.csv("test.csv",header = TRUE)

## View the data 
head(trainSet)
head(testSet)
##Crosstabs for categorical variables
table(trainSet[,c("Survived","Pclass")])

##Plots for continuous variables

boxplot(trainSet$Survived, trainSet$Age)
library(fields)
bplot.xy(trainSet$Survived, trainSet$Age)
## Views NA
summary(trainSet$Age)
## Survival rate and fare
bplot.xy(trainSet$Survived, trainSet$Fare)
summary(trainSet$Fare)

## Change Servived to factor
class(trainSet$Survived)
trainSet$Survived<-as.factor(trainSet$Survived)

set.seed(42)
model <- train(Survived ~ Pclass + Sex + SibSp + Embarked + Parch + Fare, # Survived is a function of the variables we decided to include
               data = trainSet, # Use the trainSet dataframe as the training data
               method = "rf",# Use the "random forest" algorithm
               trControl = trainControl(method = "cv", # Use cross-validation
                                        number = 5) # Use 5 folds for cross-validation
)

model
library(caret)
testSet$Survived <- predict(model, newdata = testSet)
summary(testSet)

## ------------------------------------------------------------------------
testSet$Fare <- ifelse(is.na(testSet$Fare), mean(testSet$Fare, na.rm = TRUE), testSet$Fare)

## ------------------------------------------------------------------------
testSet$Survived <- predict(model, newdata = testSet)

## ------------------------------------------------------------------------
submission <- testSet[,c("PassengerId", "Survived")]
submission
write.table(submission, file = "submission.csv", col.names = TRUE, row.names = FALSE, sep = ",")




