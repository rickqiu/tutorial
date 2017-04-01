# rCharts (D3)
#install.packages("devtools")
#require(devtools)
#install_github('rCharts', 'ramnathv')
require(rCharts)
head(iris)
names(iris) <- gsub("\\.", "", names(iris))
head(iris)

rPlot(SepalLength ~ SepalWidth | Species, color="Species", type="point", data=iris)

hairEye <- as.data.frame(HairEyeColor)
head(hairEye)
rPlot(Freq ~ Hair | Eye, color="Eye", type="bar", data=hairEye)

data("economics", package="ggplot2")
head(economics)
tail(economics)
economics$date <- as.character(economics$date)
head(economics)

ml <- mPlot(x="date", y=c("psavert", "uempmed"), type="Line", data=economics)
ml$set(pointSize=0, linewidth=1)
ml

map1 <- Leaflet$new()
map1$setView(c(51.505, -.09), zoom=13)
map1

require(jsonlite)
pizza <- fromJSON("http://www.jaredlander.com/data/PizzaPollData.php")
class(pizza)
head(pizza)
pizzaPlot <- nPlot(Percent ~ Place, data=pizza, type="multiBarChart", group="Answer")
pizzaPlot$xAxis(axisLabel="Pizza Place", rotateLabels=-45)
pizzaPlot$yAxis(axisLabel="Percent")
pizzaPlot$chart(reduceXTicks=FALSE)
pizzaPlot