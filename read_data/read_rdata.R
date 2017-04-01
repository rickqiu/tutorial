#Load binary R files
tomato <- read.table(file="data/Tomato.csv",  header = TRUE, sep=",", stringsAsFactors = FALSE )
head(tomato)
save(tomato, file="data/tomato.rdata")
rm(tomato)
tomato

load("data/tomato.rdata")
head(tomato)

n <- 20
r <- 1:10
w <- data.frame(n,r)
w

save(n,r,w, file ="data/multiples.rdata")
rm(n, r, w)
n
r
w

load("data/multiples.rdata")
n
r
w