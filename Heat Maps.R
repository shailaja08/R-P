
library(ggplot2)

setwd("D:/SL Instructor/Data Science with R")

#Reading in the data
chicagoMVT <- read.csv('motor_vehicle_theft.csv', stringsAsFactors = FALSE)

View(chicagoMVT)


#Converting the date to a recognizable format
chicagoMVT$Date <- strptime(chicagoMVT$Date, format = '%m/%d/%Y %I:%M:%S %p')

View(chicagoMVT)

#Getting the day and hour of each crime
chicagoMVT$Day <- weekdays(chicagoMVT$Date)

chicagoMVT$Hour <- chicagoMVT$Date$hour

View(chicagoMVT)
#Sorting the weekdays
dailyCrimes <- as.data.frame(table(chicagoMVT$Day, chicagoMVT$Hour))
dailyCrimes

names(dailyCrimes) <- c('Day', 'Hour', 'Freq')
dailyCrimes

summary(dailyCrimes)
str(dailyCrimes)

dailyCrimes
dailyCrimes$Hour <- as.numeric(as.character(dailyCrimes$Hour))
str(dailyCrimes)

dailyCrimes$Day <- factor(dailyCrimes$Day, ordered = TRUE, 
                          levels = c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'))

#Plotting the number of crimes each day (line graph)
ggplot(dailyCrimes, aes(x = Hour, y = Freq)) + geom_line(aes(group = Day, color = Day)) + xlab('Hour') + ylab('Number of thefts') + ggtitle('Daily number of Motor Vehicle Thefts')

#From this graph, it is clear that most of the thefts occur at night, 
#between 8 pm and 12 midnight. However, there is a lot of overlapping between the lines. 
#A heat map would be a better way to visualise this. The heatmap can be generated as follows:

ggplot(dailyCrimes, aes(x = Hour, y = Day)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name = 'Total Motor Vehicle Thefts', low = 'white', high = 'red') + theme(axis.title.y = element_blank())

#Periods of high activity of theft are denoted by the red tiles, and the periods of low activity are 
#denoted by white tiles.



