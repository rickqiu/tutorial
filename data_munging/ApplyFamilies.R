# Apply families
# The family comprises: apply, lapply , sapply, vapply, mapply, rapply, and tapply

# 1. apply
A <- matrix(rnorm(30), nrow=5, ncol=6)
A
apply(A, 2 ,sum)

# 2. lapply
A<-matrix(1:9, 3,3)
B<-matrix(4:15, 4,3)
C<-matrix(8:10, 3,2)
MyList<-list(A,B,C)
MyList

# extract the second column from the list of matrices, using the selection operator "["
lapply(MyList,"[", , 2)

# extract the first row from the list of matrices, using the selection operator "["
lapply(MyList,"[", 1, )

# extract the first row, second column element from the list of matrices, using the selection operator "["
lapply(MyList,"[", 1, 2)

# 3. sapply
sapply(MyList,"[", 1, 2)

sapply(MyList,"[", 1, 2, simplify=F)

unlist(lapply(MyList,"[",  1, 2 ))

# 4. rep
Z <- c(1, 2, 3)
Z=rep(Z,c(3, 2, 1))
Z

# 5. mapply
Q <- matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
Q

Q <- mapply(rep,1:4,4)
Q

D<-matrix(1:9, 3)
OtherList <-list(A,B,D)
OtherList
mapply(identical, MyList, OtherList)

simplefunc <- function(x, y)
{
    NROW(x) + NROW(y)
}

mapply(simplefunc, MyList, OtherList)

# 6. sweep
MyPoints <- matrix(4:15, 4)
MyPoints

MyPoints_means=apply(MyPoints,2,mean)
MyPoints_means

MyPoints_sdev=apply(MyPoints,2,sd)
MyPoints_sdev

MyPoints_Trans1=sweep(MyPoints,2,MyPoints_means,"-")
MyPoints_Trans1

MyPoints_Trans2=sweep(MyPoints_Trans1,2,MyPoints_sdev,"/")
MyPoints_Trans2

# 7. aggregate

# 7.1 Find where the product sell best
Mydf <- data.frame(DepPC=c("90","91","92","93","94","75"), 
                   DProgr=c(1:120), 
                   Qty=c(7:31,9:23,99:124,2:28,14:19,21:29,4,3,1:9,66), 
                   Delivered=ifelse(rnorm(120)>0,TRUE,FALSE))

head(Mydf, 15)
tail(Mydf)
sapply(Mydf, class)
dim(Mydf)
unique(Mydf$DepPC)

# Where does the product sell best?
DepQtySum <- aggregate(Mydf$Qty,by=Mydf["DepPC"],FUN=sum)
DepQtySum
colnames(DepQtySum) <- c("DepPc", "Qty")
RankedDepQtySum <- DepQtySum[order(DepQtySum$Qty, decreasing=TRUE), ]
RankedDepQtySum

require(ggplot2)
ggplot(aggregate(Mydf$Qty,Mydf["DepPC"],sum), aes(x=DepPC, y=x)) +
  geom_point() + 
  labs(title="Sales per department - All", x="Dept. Post Code", y="Qty")

# 7.2 caculate averages
data("diamonds")
head(diamonds)
mean(diamonds$price)

aggregate(price ~ cut, diamonds, mean)
aggregate(price ~ cut, diamonds, mean, na.rm=TRUE)
aggregate(price ~ cut + color, diamonds, mean)
aggregate(cbind(price, carat) ~ cut, diamonds, mean)
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)
