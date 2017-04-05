#Hadley Wickham's plyr

require(plyr)
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)
theList

lapply(theList, sum)
llply(theList, sum)
identical(lapply(theList, sum), llply(theList, sum))

sapply(theList, sum)
laply(theList, sum)

require(ggplot2)
data(diamonds)
head(diamonds)

aggregate(price ~ cut, diamonds, each(mean, median))

colwise

numcolwise(sum, na.rm=TRUE)(diamonds)
sapply(diamonds[, sapply(diamonds, is.numeric)], sum)