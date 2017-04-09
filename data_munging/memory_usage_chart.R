MemUsage <- read.table(file="data/memusage.csv",  sep=",", stringsAsFactors = FALSE)
head(MemUsage)

tMem <- data.frame(t(MemUsage))
tMem

tMem <- tMem[2:5,]
names(tMem) <- c("Usage", "Value1", "Value2")
tMem

dataFirst <- tMem[, c(1,2)]
dataFirst$DateTime <- c(rep("2017-04-04 15:11:35"))
dataFirst

dataSecond <- tMem[, c(1,3)]
dataSecond$DateTime <- c(rep("2017-04-07 15:24:49"))
names(dataSecond) <- c("Usage", "Value1", "DateTime")
dataSecond

chartData <- rbind(dataFirst, dataSecond)
chartData

toG <- function(y){
  floor(y/(1024 * 1024))
}

chartData$Value1 <- as.numeric(as.character(chartData$Value1))
chartData$Value1 <- sapply(chartData[, 2], toG)
chartData

require(rCharts)
n1 <- nPlot(Value1 ~ Usage, group = "DateTime", data = chartData,  type = 'multiBarChart')
n1$xAxis(axisLabel="Server Memory Usage")
n1$yAxis(tickFormat = "#! function(d) {return d + 'G' } !#")

n1