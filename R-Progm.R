##Lesson 3 ??? R programming Codes

#Arithmetic operator "+"
v <- c( 2,5.5,6)
print(v)

t <- c(8, 3, 4)
t

p <- v+t
print(p)

#Arithmetic operator "-" Subtracts second vector from the first
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v-t)

#Arithmetic operator "*" Multiplies both vectors

print(v*t)

v*t

#Arithmetic operator "/" Divide the first vector with the second
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v/t)


#Arithmetic operator "%%" Give the remainder of the first vector with the second 
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v%%t)

#Arithmetic operator "%/%" The result of division of first vector with second (quotient)
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v%/%t)

#Arithmetic operator "^" The first vector raised to the exponent of second vector
v <- c( 2,5.5,6)
t <- c(8, 3, 4)
print(v^t)

# Relational operator ">" , Checks if each element of the first vector is 
#greater than the corresponding element of the second vector
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v>t)

  # Relational operator "<", Checks if each element of the first vector is less 
#than the corresponding element of the second vector.

print(v < t)

# Relational operator "==", Checks if each element of the first vector is
#equal to the corresponding element of the second vector.
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v == t)

# Relational operator "<=", Checks if each element of the first vector is less than or equal 
#to the corresponding element of the second vector.
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v<=t)


# Relational operator ">=", Checks if each element of the first vector is 
#greater than or equal to the corresponding element of the second vector.
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v>=t)

v <- c(100,1,1)
t <- c(2,2.5,3)
v>=t

# Relational operator "!=", checks if each element of the first vector is unequal 
#to the corresponding element of the second vector.
v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v!=t)

# Logical operator "&", It is called Element-wise Logical "AND" operator. 
#It combines each element of the first vector with the corresponding element 
#of the second vector and gives a output TRUE if both the elements are TRUE.
z = c(1:6)
z
(z > 2) & (z < 5)

z[(z>2) & (z<5)]


#The longer form evaluates left to right examining only the first element of each vector,
#so the result will 
#gives only output of first element
z = c(1,3,5)
(z > 2) && (z < 5)
z[(z>2) && (z<5)]


# Logical operator "|", It is called Element-wise Logical "OR" operator. 
#It combines each element of the first vector with the corresponding element 
#of the second vector and gives a output TRUE if both the elements are TRUE.
z = 1:6
(z > 2) | (z < 5)
z[(z>2) | (z<5)]

#The longer form evaluates left to right examining only the first element of each vector,so the result will 
#give only one element
z = 1:6
(z > 8) || (z < 5)
z[(z > 2) || (z < 5)]


#Assignment Operators. These operators are used to assign values to vectors.

#"<-", "=", "<<-" are called Left Assignment

v1 <- c(3,1)
print(v1)

v1 = c(3,1)
print(v1)

v1 <<- c(3,1)
print(v1)

#"->", "->>" are called Right Assignment
c(3,1) -> v1
print(v1)

c(3,1) ->> v1
print(v1)

#operator "%in%" is used to identify if an element belongs to a vector
v1 <- 8
v2 <- 12
t <- 1:10
print(v1 %in% t) 
print(v2 %in% t)

#R if...else Statement
#In this article, you will learn to create if, if else and nested if else statement in R programming.

#Decision making is an important part of programming. 
#This can be achieved in R programming using the conditional if...else statement.

x <- 5
if(x > 0){
  print("Positive number")
}


#if...else statement

x <- -5
if(x > 0){
  print("Positive number")
} else {
  print("Negative number")
}

x <- -8
if(x >0){
  print("positive number")
} else {
  print("negative number")
}

#The above conditional can also be written in a single line as follows.

if(x > 0) print("Non-negative number") else print (c("Negative number","hello"))

#Nested if...else statement

#We can nest as many if...else statement as we want as follows.

#Only one statement will get executed depending upon the test_expressions.

x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

# switch statement
#syntax is :: switch (statement, list)
#Here, the statement is evaluated and based on this value, the corresponding 
#item in the list is returned.


x <- switch(3,"red","green","blue")
x

switch(1,"red","green","blue")

#If the numeric value is out of range (greater than the number of items in the list or smaller than 1)
#, 
#then, NULL is returned

x <- switch(4,"red","green","blue")
x

x <- switch(0,"red","green","blue")
x

#The result of the statement can be a string as well. 
#In this case, the matching named item's value is returned.

switch("color", "color" = "Yellow", "shape" = "square", "length" = 5)

switch("length", "color" = "red", "shape" = "square", "length" = 5)

#Loops in R
#Loops are used in programming to repeat a specific block of code. 
#In this article, you will learn to create a for loop in R programming.

#"For" loop

#Below is an example to count the number of even numbers in a vector.

vec <- c(1,2,3,4,5)
for(val in vec){
  print(val[1])
}


x <- c(2,5,3,9,8,11,6)
count <- 0
for (val in x) {
  if(val%%2 ==0)  count = count+1
}
print(count)

#In the above example, the loop iterates 7 times as the vector x has 7 elements.
#In each iteration, val takes on the value of corresponding element of x.
#We have used a counter to count the number of even numbers in x. 
#We can see that x contains 3 even numbers.

# "While" loop

#In R programming, while loops are used to loop until a specific condition is met.

i <- 1
while (i < 6) {
  print(i)
  i = i+1
}


k<-1
while (k < 10) {
  print(k)
  k = k+1
}

#In the above example, i is initially initialized to 1.
#Here, the test_expression is i < 6 which evaluates to TRUE since 1 is less than 6. 
#So, the body of the loop is entered and i is printed and incremented.
#Incrementing i is important as this will eventually meet the exit condition. 
#Failing to do so will result into an infinite loop.
#In the next iteration, the value of i is 2 and the loop continues.
#This will continue until i takes the value 6. The condition 6 < 6 will give FALSE and the while loop 
#finally exits.

#repeat loop
#A repeat loop is used to iterate over a block of code multiple number of times.
#There is no condition check in repeat loop to exit the loop.
#We must ourselves put a condition explicitly inside the body of the loop 
#and use the break statement to exit the loop. Failing to do so will result into an infinite loop.

x <- 1
repeat {
  print(x)
  x = x+1
  if (x == 6){
    break
  }
}


## next statement
## it helps in skipping the current iteration of a loop 

num <- 1:5
for(val in num) {
  if (val ==3) {
    next
  }
  print(val)
}

#append function
#append() function adds elements to a vector
x <- c(1:5)
x
y <- append(x, 100)
y
y <- append(x, 100, after=2)
y

#--------------------------

#c() combines values into a vector
x <- c(1,2,3,4)
x

#-------------------------

# identical function is the safe and reliable way to test whether two objects are exactly equal.
identical(1,1)
identical(1,2)

#---------------------------

#length() function gets or sets the length of an R object

#Get vector length:
x <- c(1,2,5,4,6,1,22,1)
length(x)

#Set vector length:
length(x) <- 4
x

#---------------------------

# ls function lists objects in the working environment

ls()

#---------------------------

#range() function get a vector of the minimum and maximum values

x <- c(1,2.3,2,3,4,8,12,43,-4,-1)
r <- range(x)
r

#------------------------------

# rep() function replicates the values in x.

x <- rep(1:5)
x
#Repeat 1 -5 two times
x <- rep(1:5,2)
x

#------------------------------

#rev() function reverses an R object

x <- c("green","red","yellow")
y <- rev(x)
y

x <- c(1:10)
y <- rev(x)
y

#--------------------------------

#seq() function generates a sequence of numbers.
#Generate a sequence from -6 to 7:
x <- seq(-6,7)
x

#Generate a sequence from -6 to 7 with steps of 2
x <- seq(-6,7,by=2)
x

#---------------------------------

#unique() function removes duplicated elements/rows from a vector, data frame or array

x <- c(2:8,4:10)
x
unique(x)

#--------------------------------

# tolower() function converter string to its lower case.

x <- c("Green", "Red", "Black")
tolower(x)

#--------------------------------

#toupper() function converts a string to its upper case.

x <- c("Green", "Red", "Black")
toupper(x)

#----------------------------------

#The grep() function are used for searching for matches
str <- c("Regular", "expression", "examples of R language")
x <- grep("ex",str,value=F)
x

x <- grep("ex",str,value=T)
x

#------------------------------

#summary() function is a generic function used to produce result summaries of the 
#results of various model fitting functions

setwd("G:\\R Programming and coding\\Data Science with R")
restaurant<-read.csv("Restaurant.csv")
summary(restaurant)

#------------------------------
#str function gives information about structure of the R object 
str(restaurant)

#-----------------------------

# glimpse() also gives information about an R object
# we need to install the dplyr package for this function

library(dplyr)
glimpse(restaurant)

#------------------------------

# class function returs class of an object

data <- c("East","West","East","North","North","East","West","West","West","East","North")

class(data)

# Apply the factor function.
factor_data <- factor(data)

class(factor_data)

#------------------------------

#mode() function gets or sets the type or storage mode of an object

x <- 3
mode(x)

#set the mode to character
mode(x) <- "character"
mode(x)

