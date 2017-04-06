library(arules)
data(Groceries)
Groceries
class(Groceries)
itemFrequencyPlot(Groceries,topN=20,type="absolute")


  #You will always have to pass the minimum required support and confidence.
  #We set the minimum support to 0.001
  #We set the minimum confidence of 0.8
  #We then show the top 5 rules
  # Get the rules
  rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
str(rules)
# Show the top 5 rules
inspect(rules[])
  
  # This reads easily, for example: if someone buys yogurt and cereals, 
  # they are 81% likely to buy whole milk too.
  # We can get summary info. about the rules that give us some interesting information such as:
  # The number of rules generated: 410
  # The distribution of rules by length: Most rules are 4 items long
  # The summary of quality measures: interesting to see ranges of support, lift, and confidence.
  # The information on the data mined: total data mined, and minimum parameters.
  summary(rules)
# Sorting the rules
rules<-sort(rules, by="lift", decreasing=TRUE)
inspect(rules[1:5])


  # Concise no. of rules
  rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))
summary(rules)
inspect(rules[])

  # Targeting Items
  # What are customers likely to buy before buying whole milk
  rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
                 appearance = list(default="lhs",rhs="whole milk"))
rules<-sort(rules, decreasing=TRUE,by="lift")
inspect(rules[1:5])
# What are customers likely to buy if they purchase whole milk?
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
        