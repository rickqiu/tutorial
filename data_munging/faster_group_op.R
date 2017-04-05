data("diamonds", package="ggplot2")
head(diamonds)

aggregate(diamonds$price, by=list(diamonds$cut), mean)
aggregate(price ~ cut, diamonds, mean)

# tapply is much faster
valueGroupByCut <- tapply(diamonds$price, INDEX=diamonds$cut, mean)
valueGroupByCut
class(valueGroupByCut)

require(plyr)
# ddply llply dlply adply
head(diamonds)
# faster then aggregate function
ddply(diamonds, "cut", summarize, Price=mean(price))
daply(diamonds, "cut", summarize, Price=mean(price))

head(diamonds)
#install.packages("doParallel")
require(doParallel)

cl <- makeCluster(4)
registerDoParallel(cl)

combinedResult <- ddply(diamonds, "cut", function(x) mean(x$price), .parallel=TRUE)
head(combinedResult)

stopCluster(cl)

# MapR's data.table the fastest way to aggregate data so far
require(data.table)
head(diamonds)
diaDT <- data.table(diamonds)
diaDT
diaDT[, mean(price), by=cut]

# dplyr's group_by
require(plyr)
require(dplyr)
head(diamonds)
dim(diamonds)

diamonds %>% head
diamonds %>% dim

diamonds %>% group_by(cut) %>% dplyr::summarize(Price=mean(price))

# dplyr's DB connection and group_by
download.file("http://www.jaredlander.com/data/diamonds.db", destfile = "diamonds.db", method = "curl" )
require(dplyr)
#install.packages("RSQLite")
require(RSQLite)
diaDBSource <- src_sqlite("diamonds.db")
diaDB <- tbl(diaDBSource, "diamonds")
diaDB

diaDB %>% group_by(cut) %>% dplyr::summarize(Price=mean(price))