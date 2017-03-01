###Apply Function in R
##Apply function helps to apply function to matrix row or column and returns a vector,list or list
##Type-1 -->Lapply( function applied on list)
list <- list(a=c(1,1),b=c(2,2),c=c(3,3))
list
lapply(list,sum)
##Type -2 -->Sapply (function applied on list and provide simplified result)
sapply(list,sum)
## Type --3-->Tapply(use to apply function on a factor of R object)
age <- c(23,24,25,25,26)
gender <- c("m","f","m","f","f")
fac_gen <- as.factor(gender)
fac_gen
tapply(age,fac_gen,mean)
## Type --4-->Vapply(similar to Sapply only we need to specify the type of value return)
list2<- list(a=c(1,2),b=c(2,3),c=c(3,3))
list2
vapply(list2,mean,FUN.VALUE=double(1))

