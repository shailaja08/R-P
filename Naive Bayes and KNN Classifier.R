## NaiveBayes

library (e1071)

## Naive Bayes Classifier for Discrete Predictors: we use again the Congressional Voting Records of 1984
# Note refusals to vote have been treated as missing values!

data (HouseVotes84, package="mlbench") 
View(HouseVotes84)
model <- naiveBayes(Class ~ ., data = HouseVotes84) 

head(HouseVotes84)

# predict the outcome of the first 20 records
predict(model, HouseVotes84[1:20,-1]) 

# same but displaying posteriors
predict(model, HouseVotes84[1:20,-1], type = "raw") 

# now all of them: this is the resubstituion error
pred <- predict(model, HouseVotes84[1:50,-1])


dim(HouseVotes84)
# form and display confusion matrix & overall accuracy
tab <- table(pred, HouseVotes84$Class[1:50]) 
tab
sum(tab[row(tab)==col(tab)])/sum(tab)


##---------------------------------------------------------------------

#KNN Classifier

setwd("G:\\R Programming and coding\\Data Science with R")    

#Using this command, we've imported the 'Prostate_Cancer.csv' data file

prc <- read.csv("Prostate_Cancer.csv",stringsAsFactors = FALSE) 

head(prc)

prc <- prc[-1]  #removes the first variable(id) from the data set.

head(prc)

dim(prc)

#The data set contains patients who have been diagnosed with either Malignant (M) or Benign (B) cancer

table(prc$diagnosis_result)  # it helps us to get the numbers of patients

prc$diagnosis <- factor(prc$diagnosis_result, levels = c("B", "M"), labels = c("Benign", "Malignant"))

round(prop.table(table(prc$diagnosis)) * 100, digits = 1)  
# it gives the result in the percentage form rounded of to 1 decimal place( and so it's digits = 1)

## Normalize numeric data as the scale used for the values for each variable might be different.
##The best practice is to normalize the data and transform all the values to a common scale.

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x))) }

#Once we run this code, we are required to normalize the numeric features in the data set. 
#Instead of normalizing each of the 8 individual variables we use:

prc_n <- as.data.frame(lapply(prc[2:9], normalize))

#The first variable in our data set (after removal of id) is 'diagnosis_result' 
#which is not numeric in nature. So, we start from 2nd variable. 
#The function lapply() applies normalize() to each feature in the data frame. 
#The final result is stored to prc_n data frame using as.data.frame() function

#Let's check using the variable 'radius' and 'texture'whether the data has been normalized
summary(prc_n$radius)

summary(prc_n$texture)
summary(prc_n$area)

##Creating training and test data set

#The kNN algorithm is applied to the training data set and the results are verified on the test data set.

prc_train <- prc_n[1:65,]
prc_test <- prc_n[66:100,]

#Our target variable is 'diagnosis_result' which we have not included in our training and test data sets.

prc_train_labels <- prc[1:65, 1]
prc_test_labels <- prc[66:100, 1]

#This code takes the diagnosis factor in column 1 of the prc data frame and on turn 
#creates prc_train_labels and prc_test_labels data frame.

#Training a model on data

library(class)
#Now we are ready to use the knn() function to classify test data

prc_test_pred <- knn(train = prc_train, test = prc_test,cl = prc_train_labels, k=10)

#The value for k is generally chosen as the square root of the number of observations.

#Evaluate the model performance

#We have built the model but we also need to check the accuracy of the predicted values 
#in prc_test_pred as to whether they match up with the known values in prc_test_labels. 
#To ensure this, we need to use the CrossTable() function available in the package 'gmodels'.

install.packages("gmodels")
library(gmodels)

CrossTable(x=prc_test_labels, y = prc_test_pred)

## The total accuracy of the model is 60 %( (TN+TP)/35) which shows that there may be chances to 
#improve the model performance. 

#This can be taken into account by repeating the steps 3 and 4 and by changing the k-value



##-------------------------------------------------------------

library("e1071")

setwd("D:/SL Instructor/Data Science with R")

iris <- read.csv("iris.csv") 

head(iris)

x = iris[,-5]
y = iris$Species
head(x)
head(y)

svm_model1 <- svm(x,y)
summary(svm_model1)

pred <- predict(svm_model1,x)
tab<-table(pred,y)
sum(tab[row(tab)==col(tab)])/sum(tab)






























