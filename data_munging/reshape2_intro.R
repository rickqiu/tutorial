#Hadley Wickham's reshape2
require(reshape2)
head(airquality)

# make data set long e.g. more rows, less columns
airMelt <- melt(airquality, id=c("Month", "Day"), 
                value.name = "Value", variable.name = "metric")

head(airMelt)
tail(airMelt)

dim(airquality)
dim(airMelt)

# revert the airMelt back to previous e.g. from long to wide
airCast <- dcast(airMelt, Month + Day ~ metric, value.var="Value")
head(airCast)
airCast <- airCast[, c("Ozone", "Solar.R", "Wind", "Temp", "Month", "Day")]
head(airCast)