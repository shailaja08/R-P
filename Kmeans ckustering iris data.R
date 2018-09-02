#K Means Clustering is an unsupervised learning algorithm that tries to cluster data based on 
#their similarity. Unsupervised learning means that there is no outcome to be predicted, 
#and the algorithm just tries to find patterns in the data. In k means clustering, 
#we have to specify the number of clusters we want the data to be grouped into. 
#The algorithm randomly assigns each observation to a cluster, and finds the centroid of each cluster. 

#Then, the algorithm iterates through two steps:
#Reassign data points to the cluster whose centroid is closest.
#Calculate new centroid of each cluster.

#These two steps are repeated till the within cluster variation cannot be reduced any further. 
#The within cluster variation is calculated as the sum of the euclidean distance between 
#the data points and their respective cluster centroids

#Exploring the data
#The iris dataset contains data about sepal length, sepal width, petal length, 
#and petal width of flowers of different species. Let us see what it looks like:

setwd("D:/SL Instructor/Data Science with R")
iris <- read.csv("iris.csv")

#After a little bit of exploration, I found that Petal.Length and Petal.Width 
#were similar among the same species but varied considerably between different species, 
#as demonstrated below:

library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()

#Clustering
#Okay, now that we have seen the data, let us try to cluster it. 
#Since the initial cluster assignments are random, let us set the seed to ensure reproducibility.

set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster

#Since we know that there are 3 species involved, we ask the algorithm to group the data into 3 clusters, 
#and since the starting assignments are random, we specify nstart = 20. 
#This means that R will try 20 different random starting assignments and then 
#select the one with the lowest within cluster variation.
#We can see the cluster centroids, the clusters that each data point was assigned to, 
#and the within cluster variation.

irisCluster$cluster <- as.factor(irisCluster$cluster)
ggplot(iris, aes(Petal.Length, Petal.Width, color = irisCluster$cluster)) + geom_point()



