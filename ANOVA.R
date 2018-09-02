setwd("D:/SL Instructor/Data Science with R")
restaurant<-read.csv("Restaurant.csv")
View(restaurant)

st_restaurant<- stack(restaurant)
View(st_restaurant)

head(st_restaurant)

names(st_restaurant) <- c("sales", "Menu")
st_restaurant

# ANOVA
avl<- aov(sales ~ Menu,data = st_restaurant)
summary(avl)

##-----------------------------------------------------------

head(mtcars)
#Consider the data set "mtcars" available in the R environment. 
#It gives a comparison between different car models in terms of mileage per gallon (mpg), 
#cylinder displacement("disp"), horse power("hp"), weight of the car("wt") and some more parameters.

#The goal of the model is to establish the relationship between "mpg" as a response variable 
#with "disp","hp" and "wt" as predictor variables. 
#We create a subset of these variables from the mtcars data set for this purpose.

input <- mtcars[,c("mpg","disp","hp","wt")]
head(input)

#Create Relationship Model & get the Coefficients

model <- lm(mpg ~ disp+hp+wt, data = input)
model


#Create Equation for Regression Model

# Y = a + disp.x1 + hp.x2 + wt.x3

#Apply Equation for predicting New Values

#We can use the regression equation created above to predict the mileage 
#when a new set of values for displacement, horse power and weight is provided.

#For a car with disp = 221, hp = 102 and wt = 2.91 the predicted mileage is ???

Y = 37.10+(-0.000937)*221+(-0.0311)*102+(-3.8008)*2.91
Y

##-----------------------------------------------------------------------

##Case study 2 - we will use a built-in data set called state.x7

head(state.x77)

# Lets look at the class
class(state.x77)  ## clearly it is not a dataframe , so we need to convert it into one

st = as.data.frame(state.x77)
class(st)

colnames(st)[4] = "Life.Exp"   ## no spaces in variable names
colnames(st)[6] = "HS.Grad" 

model<- lm(formula = Life.Exp ~ ., data = st)

model1<- lm(formula = Life.Exp ~ Murder+HS.Grad, data = st)

summary(model1)

##-----------------------------------------------------------------

# Creating dummy variables

setwd("D:/SL Instructor/Data Science with R")
install.packages("dummies")
library(dummies)

policy <- read.csv("Policy_Number.csv")
names(policy)
policy.new <- dummy.data.frame(policy)
policy.new
head(policy.new)

##------------------------------------------------------------------

## Interaction Regression model

#The presence of a significant interaction indicates that the effect of 
#one predictor variable on the response variable is different at different values 
#of the other predictor variable. 
#It is tested by adding a term to the model in which the two predictor variables are multiplied


setwd("D:/SL Instructor/Data Science with R")
datavar <- read.csv("dataset_iceCreamConsumption.csv")
head(datavar)

#predict ice cream consumption by its per pint price, weekly family income, 
#mean temperature, and the interaction between per pint price and weekly family income

#create the interaction variable

PRICEINCi <- datavar$PRICE * datavar$INC

interactionModel <- lm(CONSUME ~ INC + TEMP + PRICEINCi, datavar)

summary(interactionModel)

#--------------------------------------------------------------------------

#Decision Trees


library(rpart)
library(rpart.plot)
library(RColorBrewer)

installed.packages()

# data used is fetal cardiotocograms. 

#LB - FHR baseline (beats per minute) 
#AC - # of accelerations per second 
#FM - # of fetal movements per second 

# NSP - fetal state class code (N=normal; S=suspect; P=pathologic)

setwd("D:/SL Instructor/Data Science with R")

data <-read.csv("CTG.csv")
str(data)

data$NSPF <- factor(data$NSP)
str(data)

dim(data)
# Partition data into training and validation datasets

set.seed(1234)
pd <- sample(2, nrow(data), replace = TRUE , prob = c(0.8,0.2))
pd
train <- data[pd==1,]
validate <- data[pd==2,]

#decision Tree with party package
library(party)
tree <- ctree(NSPF~LB+AC+FM, data = train)
tree
plot(tree)

# Pruning the tree to make it simple by controlling parameters


tree <- ctree(NSPF~LB+AC+FM, data = train, controls = ctree_control(mincriterion = 0.90, minsplit = 100))

tree
plot(tree)

# Predict
predict(tree, validate, type = "prob")

# Decision Tree using rpart

library(rpart)

tree1 <- rpart(NSPF~LB+AC+FM, data = train)

library(rpart.plot)
rpart.plot(tree1, extra = 3)

## Misclassification of error


## Misclassification of error for train data

tab <- table(predict(tree), train$NSPF)
tab
1- sum(diag(tab))/sum(tab)

## Misclassification of error for validate data

testPred <- predict(tree, newdata = validate)
tab <- table(testPred, validate$NSPF)
tab
1- sum(diag(tab))/sum(tab)

