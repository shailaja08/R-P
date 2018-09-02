
## Distance Measures

## Euclidean Distance

#The measure of distance is an important tool in statistical analysis. 
#It quantifies dissimilarity between sample data for numerical computation. 

#For example, the data frame mtcars consists of measurements from a collection of 32 automobiles.
##Since there are 11 measurement attributes for each automobile, the data set can be seen as a collection 
#of 32 sample vectors in an 11 dimensional space.

#To find out the dissimilarity between two automobiles, say Honda Civic and Camaro Z28, 
#we can calculate the distance between them with the dist function:

library(datasets)
View(mtcars)

dim(mtcars)
x <- mtcars["Honda Civic",]
y <- mtcars["Camaro Z28",]
dist(rbind(x, y)) 


##Likewise, we can compute the distance between Camaro Z28 and Pontiac Firebird:
z <- mtcars["Pontiac Firebird",]
dist(rbind(x,y,z)) 

#As the distance between Camaro Z28 and Pontiac Firebird (86.267) is smaller than the 
#distance between Camaro Z28 and Honda Civic (335.89), we conclude that Camaro Z28 
#is more similar to Pontiac Firebird than to Honda Civic.

# manhattan distance
dist(rbind(x, y, method = "manhattan")) 
dist(rbind(y, z, method = "manhattan")) 


#minkowski

dist(rbind(x, y, method = "minkowski")) 

install.packages("lsa")
library(lsa)

a <- c(-0.012813841, -0.024518383, -0.002765056,  0.079496744,  0.063928973,
       0.476156960,  0.122111977,  0.322930189,  0.400701256,  0.454048860,
       0.525526219)

b <- c(0.64175768,  0.54625694,  0.40728261,  0.24819750,  0.09406221, 
       0.16681692, -0.04211932, -0.07130129, -0.08182200, -0.08266852,
       -0.07215885)



cosine_sim <- cosine(a,b)

cosine_sim


?dist


## Correlation coefficient

setwd("D:/SL Instructor/Data Science with R")

cust_data<-read.csv("CustomerData.csv")
head(cust_data)

corr_matrix <- cor(cust_data,cust_data)
corr_matrix
write.csv(corr_matrix, "corr_matrix.csv")

#----------------------------------------------------------

#Upper Tailed

xbar <- 2.1  # sample mean

mu0 <- 2 # hypothesized value

sigma <- 0.25

n <- 35

z = (xbar - mu0)/(sigma/sqrt(n))

z  # test statistic

#Lets now calculate the critical value at .05 significance level

alpha <- .05
z.alpha <- qnorm(1-alpha)
z.alpha  # critical value

## Test diagnosis shows that test statistic 2.366432 is greater than the critical value 1.6449.
# Therefore , at .05 significance level , we reject the null hypothesis , i.e the claim of at most
# 2 grams of saturated fat in a chips packet should be rejected.

#Alternative Solution
#Instead of using the critical value, we apply the pnorm function to compute the 
# upper tail p-value of the test statistic. 

#If it turns out to be less than .05 we will reject null hypothesis

pval <- pnorm(z, lower.tail = TRUE)
pval

## For more examples please refer to http://www.r-tutor.com/elementary-statistics/hypothesis-testing

###----------------------------------------------------------------------

## One-sample t-test  "http://www.stat.columbia.edu/~martin/W2024/R2.pdf"
#Ex. An outbreak of Salmonella-related illness was attributed to ice cream produced at a
#certain factory. Scientists measured the level of Salmonella in 9 randomly sampled
#batches of ice cream. The levels (in MPN/g) were:
  
 # 0.593 0.142 0.329 0.691 0.231 0.793 0.519 0.392 0.418

#Is there evidence that the mean level of Salmonella in the ice cream is greater than 0.3
#MPN/g?


#Let mu be the mean level of Salmonella in all batches of ice cream. Here the hypothesis
#of interest can be expressed as:

H0: mu = 0.3
Ha: mu > 0.3

#Hence, we will need to include the options alternative="greater", mu=0.3. Below is the
#relevant R-code:

x = c(0.593, 0.142, 0.329, 0.691, 0.231, 0.793, 0.519, 0.392, 0.418)
t.test(x, alternative="greater", mu=0.3)

##Interpretation  
#From the output we see that the p-value = 0.029. Hence, there is moderately strong
#evidence that the mean Salmonella level in the ice cream is above 0.3 MPN/g.

#Two-sample t-tests
#Ex. 
# 6 subjects were given a drug (treatment group) and an additional 6 subjects a
#placebo (control group). Their reaction time to a stimulus was measured (in ms). We
#want to perform a two-sample t-test for comparing the means of the treatment and
#control groups.

#Let mu1 be the mean of the population taking medicine and mu2 the mean of the untreated
#population. Here the hypothesis of interest can be expressed as:


H0: mu1 = mu2

Ha: mu1 < mu2

Control = c(91, 87, 99, 77, 88, 91)
Treat = c(101, 110, 103, 93, 99, 104)

t.test(Control,Treat,alternative="less", var.equal=TRUE)

##-------------------------------------------------------------------

## Chi-square test in R - Case study

library(MASS)
 
head(survey)

tbl <- table(survey$Smoke, survey$Exer)
tbl

## Significance level alpha = .05

chisq.test(tbl)

















