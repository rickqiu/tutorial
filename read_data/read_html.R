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