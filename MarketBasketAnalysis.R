# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set
data("Groceries")
head(Groceries)

View(Groceries)


#We are now ready to mine some rules!
#You will always have to pass the minimum required support and confidence.
#We set the minimum support to 0.001
#We set the minimum confidence of 0.8


# Get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# look at summary of the rules
summary(rules)

# reduce to further smaller number of rules
rules <- apriori(Groceries, parameter = list(maxlen=3 ,supp = 0.001, conf = 0.8))

?apriori

# See the rules
inspect(rules)

# check the summary of the data to check the most frequent item/items
summary(Groceries)

# whole milk is the most frequent item

# reduce to further smaller number of rules keeping whole milk in RHS
rules <- apriori(Groceries, parameter = list(maxlen=3 ,supp = 0.001, conf = 0.8), 
                 appearance = list(rhs = "whole milk", default = "lhs"))


inspect(rules)
#_______________________________________________________________________________________________________



setwd("D:/SL Instructor/Data Science with R")

mydata <- read.csv('Cosmetics.csv', header = T, colClasses = "factor")

View(mydata)

library(arules)
rules <- apriori(mydata)

summary(rules)

#Reduce to smaller number of rules

rules <- apriori(mydata, parameter = list(minlen = 2, maxlen = 3, supp=.7))
inspect(rules)

# Finding interesting rules
rules <- apriori(mydata,parameter = list(minlen = 2, maxlen=3, conf=.7), 
                appearance=list(rhs=c("Foundation=Yes"), default = "lhs"))

# we have chosen foundation in RHS as foundation is most sold object

summary(mydata)

# inspect the rules
inspect(rules)

# Visualize the rules

library(arulesViz)
plot(rules)








