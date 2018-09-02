# Apply functions more examples

# create three sets of observations. The first has mean 0, second mean of 2, third of mean of 5, 
#and with 30 rows using rnorm(random normal)

m <- matrix(data=cbind(rnorm(30, 0), rnorm(30, 2), rnorm(30, 5)), nrow=30, ncol=3)
m

#First I want to make sure I created that matrix correctly, three columns each with a mean 0, 2 and 5 
#respectively. We can use apply and the base mean function to check this

#We tell apply to traverse row wise or column wise by the second argument. 
#In this case we expect to get three numbers at the end, the mean value for each column, 
#so tell apply to work along columns by passing 2 as the second argument. 
#But let's do it wrong for the point of illustration:

apply(m, 1, mean)

#Passing a 1 in the second argument, we get 30 values back, giving the mean of each row. 
#Not the three numbers we were expecting, try again.

apply(m, 2, mean)

#Great. We can see the mean of each column is roughly 0, 2, and 5 as we expected.

#Our own functions

#Let's say I see that negative number and realise I wanted to only look at positive values. 
#Let's see how many negative numbers each column has, using apply again:

apply(m, 2, function(x) length(x[x<0]))

#So 19 negative values in column one, 1 negative value in column two, and none in column three. 
#More or less what we would expect for three normal distributions with the given means.

#The function takes one argument, which I have arbitrarily called x. 
#In this case x will be a single column of the matrix

#Is it a 1 column matrix or a just a vector? Let's have a look:

apply(m, 2, function(x) is.matrix(x))

#Let's check they are vectors as we might expect

apply(m, 2, is.vector)

#let's look at the mean value of only the positive values:

apply(m, 2, function(x) mean(x[x>0]))

#Using sapply and lapply








































