
#Word clouds or tag clouds are graphical representations of word frequency that give 
#greater prominence to words that appear more frequently
slam_url <- "http://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz"
install.packages(slam_url, repos = NULL, type = "source")


#We will use a dataset containing around 200k Jeopardy questions

#We will require three packages for this: tm, SnowballC, and wordcloud.
library(tm)
library(wordcloud)
library(SnowballC)
setwd("G:\\R Programming and coding\\Data Science with R given by trainer")
# Read the file
jeopQ <- read.csv('JEOPARDY_CSV.csv', stringsAsFactors = FALSE)
View(jeopQ)
# The actual questions are available in the Question column.
#Now, we will perform a series of operations on the text data to simplify it.
#First, we need to create a corpus.Corpus is a list of a document.

jeopCorpus <- Corpus(VectorSource(jeopQ$Question))
jeopCorpus
#Next, we will convert the corpus to a lowercase.
jeopCorpus <- tm_map(jeopCorpus, content_transformer(tolower))

#Then, we will remove all punctuation and stopwords, and convert it to a plain text document.. 
#Stopwords are commonly used words in the English language such as I, me, my, etc. 
#You can see the full list of stopwords using stopwords('english').
jeopCorpus <- tm_map(jeopCorpus, removePunctuation)

jeopCorpus <- tm_map(jeopCorpus, removeWords, stopwords('english'))


#Next, we will perform stemming. This means that all the words are converted to their stem 
#(Ex: learning -> learn, walked -> walk, etc.). This will ensure that different forms of the 
#word are converted to the same form and plotted only once in the wordcloud.
jeopCorpus <- tm_map(jeopCorpus, stemDocument)

#Now, we will plot the wordcloud.
wordcloud(jeopCorpus, max.words = 100, random.order = FALSE)
