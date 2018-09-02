#Upper Tailed Test 

xbar <- 2.1  # sample mean

mu0 <- 2 # hypothesized value--claim value

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

pval <- pnorm(z, lower.tail = FALSE)
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

# H0: mu = 0.3
# Ha: mu > 0.3

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


# H0: mu1 = mu2

# Ha: mu1 < mu2

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
##As the p-value 0.4828 is greater than the .05 significance level, we do not reject the null hypothesis that the smoking habit is independent of the exercise level of the students.
