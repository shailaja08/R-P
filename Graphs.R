## Creating Simple Bar Charts
View(mtcars)
counts <- table(mtcars$gear) 
counts
barplot(counts, main="Car Distribution", 
        xlab="Number of Gears")
# horizontal bar chart
barplot(counts, main = "Car Distribution", horiz = TRUE, names.arg = c("3 Gears", "4 Gears", "5 Gears"))
# Editing a simple Bar Chart
barplot(counts, main = "Car Distribution", xlab="Number of Gears", ylab = "Frequency", 
        legend= rownames(counts),col = c("red", "yellow", "green"))

## Create a stacked barplot with colors and legends
counts <- table(mtcars$vs, mtcars$gear) 
counts
barplot(counts, main = "Car Distribution by Gears and VS", xlab="Number of Gears", 
        legend= rownames(counts),col = c("red", "yellow"))
## Create a Grouped Bar Plot
barplot(counts, main = "Car Distribution by Gears and VS", xlab="Number of Gears", 
        legend= rownames(counts),col = c("red", "yellow"), beside = TRUE)

## Pie-Charts
# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Adding percentages to Pie-chart
slices <- c(10, 12, 4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
pct
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") 
lbls
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

# Create a 3-D pie chart
# Install "plotrix" package
library(plotrix)
slices <- c(10, 12, 4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")

#Histograms
#Create a Histogram
View(mtcars)
hist(mtcars$mpg)
#coloured histogram
hist(mtcars$mpg, col = "darkgreen")

## Create a Kernel density plot
d <- density(mtcars$mpg)
plot(d)
# Fill density plot with color
plot(d, main = "Kernel Density of Miles per Gallon")
polygon(d, col = "Skyblue", border = "Black")

## Line Charts
weight <- c(2.5, 2.8, 3.2, 4.8, 5.1, 5.9, 6.8, 7.1, 7.8, 8.1)
months <- c(0,1,2,3,4,5,6,7,8,9)
plot(months, weight, type = "b", main = "Baby Weight Chart")
#create a box-plot
vec <- c(-30,2,5,6,4,8,1,2,3,2,4)
summary(vec)
boxplot(vec, varwidth = TRUE)
boxplot(mpg~cyl,data=mtcars, main="Car Milage Data", 
        xlab="Number of Cylinders", ylab="Miles Per Gallon")





install.packages("ggplot2")
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

#Reference STHDA
#Text mining methods allow us to highlight the most frequently used keywords in a paragraph of texts. 
#One can create a word cloud, also referred as text cloud or tag cloud, which is a visual representation 
#of text data.
#The most used keywords stand out better in a word cloud
#Step 1 :Install and load the required packages
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


## Import the text file. To import the file saved locally in your computer, 
#type the R code (text <- readLines(file.choose())  else you can also read a text file from internet. 
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)
# Load the data as a corpus: corpus is a collection of documents. The corpus function creates a collection of 
#documents in R environment
docs <- Corpus(VectorSource(text))
inspect(docs)
#Transformation is performed using tm_map() function to replace, for example, 
#special characters from the text.Replacing "/", "@" and "|" with space:
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Transformation Steps
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords: 
#stopwords are those words which are very common and have zero information value
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming : Reducing a word to its base form
docs <- tm_map(docs, stemDocument)
#Build a term-document matrix 
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
#Generate the Word cloud
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))



