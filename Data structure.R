# Accessing vector elements


vec <- c("a","b","cx","d","e","f")
vec[1]

vec[c(2,4)]

#---------------------------------------------
# matrix
v <- c(1,2,3,4)
foo <- matrix(v, nrow = 2, ncol = 2)
foo

foo <- matrix(v, ncol = 2, nrow = 2)
foo

foo <- matrix(v, nrow = 2, ncol = 2, byrow = TRUE)
foo

foo <- matrix(v, nrow = 2, ncol = 2, byrow = FALSE)
foo


#accessing matrix elements

mat <- matrix (c(1:4),nrow = 2, ncol = 2)
mat

#access first row in the matrix 
mat[1,]

#access second row in the matrix 
mat[2,]

#access first column in the matrix 
mat[,1]

#access second column in the matrix 

mat[,2]

#---------------------------------------------------------------

## Arrays can have more than 2 dimensions

#Arrays are the R data objects which can store data in more than two dimensions
#For example ??? If we create an array of dimension (2, 3, 4) 
#then it creates 4 rectangular matrices each with 2 rows and 3 columns

#The following example creates an array of two 3x3 matrices each with 3 rows and 3 columns.

# Create two vectors of different lengths.
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# Take these vectors as input to the array.
result <- array(c(vector1,vector2),dim = c(3,3,2))
result

result <- array(c(vector1,vector2),dim = c(3,3,3))
result

result <- array(c(vector1,vector2),dim = c(2,3,5))
result


#accessing array elements 

# Create two vectors of different lengths.
vector3 <- c(5,9,3)
vector4 <- c(10,11,12,13,14,15)
vresult <- array(c(vector3,vector4),dim = c(3,3,2))
vresult

# Print the third row of the second matrix of the array.
vresult[3,,2]

# Print the element in the 1st row and 3rd column of the 1st matrix.
vresult[1,3,1]


#---------------------------------------------------

#Create a dataframe

emp_id = c (1:5)
emp_name = c("Rick","Dan","Michelle","Ryan","Gary")
salary = c(623.3,515.2,611.0,729.0,843.25)
emp.data <- data.frame(emp_id, emp_name, salary)
emp.data

# you can also view the newly created object in tabular format in Environment pane

View(emp.data)

# Elements of data frames

emp.data$emp_id
emp.data$emp_name
emp.data$salary

emp.data[,c("emp_id","salary")]
subset(emp.data,select=-c(emp_id,salary))
#---------------------------------------------------------------------

#Factors

#Factors are the data objects which are used to categorize the data and store it as levels. 
#They can store both strings and integers. They are useful in the columns which have a 
#limited number of unique values. Like "Male, "Female" and True, False etc. 
#They are useful in data analysis for statistical modeling

gender <- c("Male" , "Female" , "Female" , "Male")
gender
status <- c("Poor" , "Improved", "Excellent" , "Poor" , "Excellent")
factor_gender <- as.factor(gender)
factor_gender
factor_status <- factor(status)
factor_status

# Create a vector as input.
data <- c("East","West","East","North","North","East","West","West","West","East","North")

is.factor(data)

# Apply the factor function.
factor_data <- factor(data)

factor_data
is.factor(factor_data)

#-----------------------------------------------------------------
#creating a list

# Create a list containing strings, numbers, vectors and a logical values.
list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
list_data

#--------------------------------------------------------
# Importing .txt file 

setwd("G:\\R Programming and coding\\Data Science with R")
restaurant<-read.table("Restaurant.txt", header = FALSE)
restaurant
restaurant_csv <-read.csv("Restaurant.CSV", header = TRUE)
restaurant_csv

#Importing an excel file

# install a package called . This package is used to read excel files into R
install.packages("xlsx")
# Load the library into R workspace.
library("xlsx")

# Read the first worksheet in the file input.xlsx.
data <- read.xlsx("import.xlsx", sheetIndex = 1)
data

## alternate way
install.packages("readxl")
library(readxl)
# xlsx files
my_data2 <- read_excel("import.xlsx")
my_data2
write.csv(data, "my_data2.csv")
