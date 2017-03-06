##Visualization in R

##Type of Graphics-
###1)Bar Chart 2) Pie Chart 3) Histogram 4)Kernel desity Plot 5)Line Charts
## 6)Box plot 7)Heat Map 8)Word Cloud


## Type 1--------------------Bar Chart--------------------------
count <- table(mtcars$gear)
count
barplot(count,horiz = TRUE)#### By Default Horiz=FALSE
barplot(count,main= "Simple Bar Chart",xlab="Improvement", ylab = "Frequency",
        col=c("Yellow","red","green"),legend=rownames(count))


  ####---------Stacked Bar Chart  (when there is a matrix)--------
count <- table(mtcars$vs,mtcars$gear)
count
barplot(count,main= "Simple Stacked Bar Chart",xlab="number of gear",
        col=c("Yellow","red","green"),legend=rownames(count))
barplot(count,main= "Simple Stacked Bar Chart",xlab="number of gear",
        col=c("Yellow","red","green"),legend=rownames(count),beside=TRUE) ##### Use Beside to have bar next to each other
   
##Type 2---------------Pie Chart(Install Package plotrix-------------------
library(plotrix)
slice <- c(10,24,29,47)
lbls <- c("US","IND","UK","PAK")
pie(slice,labels = lbls,main="Pie chart",col=rainbow(4))
## have percentage also
pct <- round(slice/sum(slice)*100)
pct
lbls1 <- paste(lbls," ",pct,"%",seq="")
lbls1
pie(slice,labels = lbls1,col=rainbow(4),main="Percentage pie chart")
###---------Pie 3D
pie3D(slice,labels = lbls1,col=rainbow(4),main="Percentage 3 D pie chart",explode = 0.0)
##Type 3-----Histogram------has x,y axis---bars of different height
hist(mtcars$mpg)
hist(mtcars$mpg,breaks=8,col=c("lightgreen"))


##Type 4-------------Kernal Density plot------------
density <- density(mtcars$mpg)
density
plot(density)
plot(density,main="Kernal Density Plot")
polygon(density,col="skyblue",border="black")

## Type 5------Line Chart-------(we create line chart when we have time)
month <- c(1:9)
month
weight <- seq(2.5,5,by=0.3)
weight
plot(month,weight,main="babt weigth")
plot(month,weight,main="babt weigth",type="b") ## Give type = b for making a line chart


## Type 6------Box Plot Chart------
vec <- c(3,4,5,3,2,5,6,4,3,7)
summary(vec)
boxplot(vec,varwidth = TRUE ) ## to increase the width give the varwidth= TRUE
--
