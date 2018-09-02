###
##K Means Clustering is an unsupervised learning algorithm that tries to cluster data based on 
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
setwd("D:/SL Instructor/Data Science with R")
getwd()



##Read the data in the file
cust_data<-read.csv("Insurance_Dataset_Clustering_Analysis.csv")
head(cust_data)
### Select the requried columns for clustering
cust_data<-cust_data[,c(1,2,4,5,7,9,10,13)]

###Verify the data
colnames(cust_data)
head(cust_data)


library(amap)

###Run the kmeans algorithm to generate the clusters
k1<-Kmeans(cust_data[,-c(1)], 3,nstart = 1, method = c("euclidean"))



###Fetch the group means for each variable
k1$centers

###Fetch size/n of obs for the groups
k1$size
###Fetch the cluster for each obs
k1$cluster

mydata <- data.frame(cust_data, k1$cluster)
head(mydata)
