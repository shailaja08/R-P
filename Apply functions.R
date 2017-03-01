###Apply Function in R
##Apply function helps to apply function to matrix row or column and returns a vector,list or list
##Type-1 -->Lapply( function applied on list)
list <- list(a=c(1,1),b=c(2,2),c=c(3,3))
list
lapply(list,sum)
##Type -2 -->Sapply (function applied on list and provide simplified result)
sapply(list,sum)
