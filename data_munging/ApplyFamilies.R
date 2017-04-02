# Apply families
# The family comprises: apply, lapply , sapply, vapply, mapply, rapply, and tapply

# 1. apply
X<-matrix(rnorm(30), nrow=5, ncol=6)
apply(X,2 ,sum)

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

# 5. sweep
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

# 6. aggregate







