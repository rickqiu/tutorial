# Read Data into R
 
#1. Example to read csv into R

download.file("http://www.jaredlander.com/data/Tomato%20First.csv", destfile = "data/Tomato.csv", mode="w")
tomato <- read.table(file="data/Tomato.csv",  header = TRUE, sep=",")
head(tomato)
class(tomato$Tomato)

tomato <- read.table(file="data/Tomato.csv",  header = TRUE, sep=",", stringsAsFactors = FALSE)
class(tomato$Tomato)


#2. Example to read excel into R

download.file("http://www.jaredlander.com/data/ExcelExample.xlsx", destfile = "data/ExcelExample.xlsx", mode="wb")


require(readxl)
tomatoXL <- read_excel('data/ExcelExample.xlsx', sheet=1)
head(tomatoXL)
class(tomatoXL$Source)

tomatoXL <- read_excel('data/ExcelExample.xlsx', sheet='Wine')

#install.packages("openxlsx")
require(openxlsx)

tomatoXL1 <- read.xlsx("data/ExcelExample.xlsx", sheet=1)
head(tomatoXL1)

#3. Example to read DB data into R
#install.packages("rJava")
#install.packages("RJDBC", dep=TRUE)


Sys.setenv(JAVA_HOME='/jdk1.6.0_43')
options(java.parameters="-Xmx2g")
library(rJava)

.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))


require(RJDBC)

jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="lib/ojdbc6.jar")

dbSendUpdate(conn, statement, ...)

dbSendUpdate(jdbcConnection, "UPDATE RAN4_ERR_EVNTS SET ENDLOCATIONLATITUDE = 51.5062, ENDLOCATIONLONGITUDE = 0.12223 WHERE CALLTYPE='MO'")
dbSendUpdate(jdbcConnection, "UPDATE RAN4_ERR_EVNTS SET IMEITAC = 35194003")
 

ranError <- dbGetQuery(jdbcConnection, "SELECT *  FROM RAN4_ERR_EVNTS")
print(ranError)
class(ranError)
# Close connection
dbDisconnect(jdbcConnection)

#4. Load binary R files
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

#5. Load data included with R

library(ggplot2)
data(diamonds)
head(diamonds)

install.packages("reshape2")
data("tips", package ="reshape2")
head(tips)

#show available data
data()

#6. Scrape data from the web
#install.packages("XML")
require(XML)
theURL <- "http://www.jaredlander.com/2012/02/another-kind-of-super-bowl-pool/"
bowl <- readHTMLTable(theURL, which=1, header=FALSE, stringsAsFactors=FALSE)
bowl

theURL1 <- "http://www.menupages.com/restaurants/fiores-pizza/menu"
thePage1 <- readLines(theURL1)
head(thePage1)

pageRender <- htmlParse(thePage)
address <- xpathApply(pageRender, "//li[@class='address adr']/span[@class='addr street-address']", fun=xmlValue)[[1]]
address

city <- xpathApply(pageRender, "//li[@class='address adr']/span/span[@class='locality']", fun=xmlValue)[[1]]
city

headers <- xpathSApply(pageRender, "//*[@id='restaurant-menu']/h3", fun=xmlValue )
headers

items <- xpathSApply(pageRender, "//table")
items
items <- lapply(items, readHTMLTable, stringsAsFactors=FALSE)
head(items)

require(plyr)
menu <- "http://www.menupages.com/restaurants/all-areas/all-neighborhoods/pizza/"
doc <- htmlParse(menu)
placeNameLink <- xpathApply(doc, "//table/tbody/tr/td[starts-with(@class, 'name-address')]/a[starts-with(@class, 'link')]",
                            fun = function(x){c(Name=xmlValue(x, recursive = FALSE), 
                                                Link=xmlAttrs(x)[2])})
#placeNameLink
placeNameLink <- ldply(placeNameLink)
head(placeNameLink)
tail(placeNameLink)





