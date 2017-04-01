# Histogram
require(ggplot2)
data("diamonds")
head(diamonds)
class(diamonds)
hist(diamonds$carat)
hist(diamonds$carat, main="Carat Histogram", xlab = "carat")

# Scatterplot

plot(diamonds$carat, diamonds$price, main="Price v.s. Carat", xlab = "Carat", ylab = "Price")
plot(price ~ carat, data=diamonds,  main="Price v.s. Carat", xlab = "Carat", ylab = "Price")

# Boxplot
boxplot(diamonds$carat, main="Carat Boxplot")

# ggplot

#1. Histogram
ggplot(data=diamonds) + geom_histogram(aes(x=carat))
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth = .5 )

#2. Density
ggplot(data=diamonds) + geom_density(aes(x=carat))
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="grey50")

#3. Scatterplot
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point() 
g + geom_point(aes(color=color))
g + geom_point(aes(color=color, shape=clarity))
g + geom_point(aes(color=color, shape=cut))


#4. Boxplot
ggplot(diamonds)
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()

g <- ggplot(diamonds, aes(y=carat, x=cut))
g + geom_point() + geom_violin()
g + geom_violin() + geom_point()
g + geom_jitter() + geom_violin()

#5. Line plots
head(economics)
ggplot(economics, aes(x=date, y=pop)) + geom_line()

require(lubridate)
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics)

econ2005 <- economics[which(economics$year >= 2005),]
nrow(economics)
nrow(econ2005)
head(econ2005)
econ2005$month <- month(econ2005$date, label = TRUE )
head(econ2005)

require(scales)
g <- ggplot(econ2005, aes(x=month, y=pop))
g <- g + geom_line(aes(color=factor(year), group=year))
g <- g + scale_color_discrete(name="Year")
g <- g + scale_y_continuous(labels=comma )
g <- g + labs(title="Population Growth", x="Month", y="Population")
g
g <- g + theme(axis.text.x=element_text(angle = 90, hjust=1 ))
g

# Edward Tufte's small multiples
require(ggplot2)
data("diamonds")
head(diamonds)
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point(aes(color=color)) + facet_wrap(~color)
g + geom_point(aes(color=color)) + facet_grid(cut~clarity)

ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)


ggplot(diamonds, aes(x=carat, y=price, color=color, shape=cut, size=depth)) + geom_point()

# Jeffrey Arnold's ggthemes
#install.packages("ggthemes")
#install.packages("installr")
#require(installr)
#updateR()

require(ggplot2)
data("diamonds")
require(ggthemes)
g <- ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
g
g + theme_wsj()
g + theme_economist() + scale_color_economist()
g + theme_tufte()
g + theme_excel() + scale_color_excel()


# ggplot
hist(diamonds$carat)
hist(diamonds$carat, main="Carat Histogram", xlab = "carat")
plot(diamonds$carat, diamonds$price, main="Price v.s. Carat", xlab = "Carat", ylab = "Price")
plot(price ~ carat, data=diamonds,  main="Price v.s. Carat", xlab = "Carat", ylab = "Price")
boxplot(diamonds$carat, main="Carat Boxplot")


ggplot(data=diamonds) + geom_histogram(aes(x=carat))
ggplot(data=diamonds) + geom_histogram(aes(x=carat), binwidth = .5 )
ggplot(data=diamonds) + geom_density(aes(x=carat))
ggplot(data=diamonds) + geom_density(aes(x=carat), fill="grey50")
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point()
g + geom_point(aes(color=color))
g + geom_point(aes(color=color, shape=clarity))
g + geom_point(aes(color=color, shape=cut))
ggplot(diamonds)
ggplot(diamonds, aes(y=carat, x=1)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_boxplot()
ggplot(diamonds, aes(y=carat, x=cut)) + geom_violin()
g <- ggplot(diamonds, aes(y=carat, x=cut))
g + geom_point() + geom_violin()
g + geom_violin() + geom_point()
g + geom_jitter() + geom_violin()
head(economics)
ggplot(economics, aes(x=date, y=pop)) + geom_line()

require(lubridate)
economics$year <- year(economics$date)
economics$month <- month(economics$date)
head(economics)
econ2005 <- economics[which(economics$year >= 2005),]
nrow(economics)
nrow(econ2005)
head(econ2005)
econ2005$month <- month(econ2005$date, label = TRUE )
head(econ2005)

require(scales)
g <- ggplot(econ2005, aes(x=month, y=pop))
g <- g + geom_line(aes(color=factor(year), group=year))
g <- g + scale_y_continuous(labels=comma )
g <- g + labs(title="Population Growth", x="Month", y="Population")
g

g <- ggplot(econ2005, aes(x=month, y=pop))
g <- g + geom_line(aes(color=factor(year), group=year))
g <- g + scale_color_discrete(name="Year")
g <- g + scale_y_continuous(labels=comma )
g <- g + labs(title="Population Growth", x="Month", y="Population")
g
g <- g + theme(axis.text.x=element_text(angle = 90, hjust=1 ))
g

require(ggplot2)
data("diamonds")
head(diamonds)
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point(aes(color=color)) + facet_wrap(~color)
g + geom_point(aes(color=color)) + facet_grid(cut~clarity)
ggplot(diamonds, aes(x=carat)) + geom_histogram() + facet_wrap(~color)
ggplot(diamonds, aes(x=carat, y=price, color=color, shape=cut, size=depth)) + geom_point()

require(ggplot2)
data("diamonds")
require(ggthemes)
g <- ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
g
g + theme_wsj()
g + theme_economist() + scale_color_economist()
g + theme_tufte()
g + theme_excel() + scale_color_excel()

require(ggplot2)
data("diamonds")
g <- ggplot(diamonds, aes(x=carat, y=price))
g + geom_point(aes(color=color)) + facet_wrap(~color)

g + geom_point(aes(color=color)) + facet_grid(cut~clarity)