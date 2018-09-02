## Logistic regression
data("mtcars")
head(mtcars)
## We do regression on VS,Wt and DISP...VS(dependent variable) is categorical in nature(has binary outcome)
model <- glm(formula = vs~wt+disp,data=mtcars,family = "binomial")
?glm
summary(model)
