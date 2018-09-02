install.packages("ggplot2")
library(ggplot2)
### data ==mpg
qplot(displ,hwy,data=mpg)
qplot(displ,hwy,data=mpg,color=drv)
qplot(displ,hwy,data=mpg,geom=c("point","smooth"))
## Histogram using qplot
qplot(hwy,fill=drv,data=mpg)
## Facets
qplot(displ,hwy,data=mpg,facets =.~drv)
qplot(hwy,facets=.~drv,data=mpg,binwidth=2)## gives as col
qplot(hwy,facets=drv~.,data=mpg,binwidth=2)##gives as rows
#````````````````````````````````````````````````````````````````````````````````````````````````
## using maacs data
str(maacs)
qplot(log(eno),data=maacs)
qplot(log(eno),data=maacs,fill=mopos)
qplot(log(pm25),log(eno),data=maacs)
qplot(log(pm25),log(eno),data=maacs,shape=mopos)
qplot(log(pm25),log(eno),data=maacs,shape=mopos,col=mopos)
######
g<-ggplot(maacs,aes(pm25,duBedMusM))
g
p<- g+geom_point()
p
