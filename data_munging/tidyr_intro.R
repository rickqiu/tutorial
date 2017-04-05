# Hadley Wickham's tidyr
#install.packages("tidyr")
require(tidyr)
require(magrittr)
head(airquality)

# convert from wide to long
airGather <- airquality %>% gather(Metric, Value, -c(Month, Day))
head(airGather)

airGather <- gather(airquality, Metric, Value, -c(Month, Day))
head(airGather)

data(iris)
head(iris)
mini_iris <- iris[c(1, 51, 101), ]

# gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
gather(mini_iris, key = flower_att, value = measurement,
       Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)

# same result but less verbose
gather(mini_iris, key = flower_att, value = measurement, -Species)

# convert from long to wide
airSpread <- airGather %>% spread(Metric, Value)
head(airSpread)