#Example to read excel into R
#download.file("http://www.jaredlander.com/data/ExcelExample.xlsx", destfile = "data/ExcelExample.xlsx", mode="wb")

require(readxl)
tomatoXL <- read_excel('data/ExcelExample.xlsx', sheet=1)
head(tomatoXL)
class(tomatoXL$Source)

wineXL <- read_excel('data/ExcelExample.xlsx', sheet='Wine')
head(wineXL)

#install.packages("openxlsx")
require(openxlsx)

tomatoXL1 <- read.xlsx("data/ExcelExample.xlsx", sheet=1)
head(tomatoXL1)