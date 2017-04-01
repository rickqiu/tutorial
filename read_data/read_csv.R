#Example to read csv into R
#download.file("http://www.jaredlander.com/data/Tomato%20First.csv", destfile = "data/Tomato.csv", mode="w")

tomato <- read.table(file="data/Tomato.csv",  header = TRUE, sep=",")
head(tomato)
class(tomato$Tomato)

tomato <- read.table(file="data/Tomato.csv",  header = TRUE, sep=",", stringsAsFactors = FALSE)
class(tomato$Tomato)