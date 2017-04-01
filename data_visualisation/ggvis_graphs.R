# ggvis
#install.packages("ggvis")
require(ggvis)
data("cocaine")
head(cocaine)

#require(ggplot2)
#ggplot(cocaine, aes(x=weight, y=price)) + geom_point()

cocaine %>% ggvis(x=~weight, y=~price) %>% layer_points()
cocaine %>% ggvis(x=~weight, y=~price, fill=~potency) %>% layer_points()
cocaine %>% ggvis(x=~weight, y=~price, stroke=~potency) %>% layer_points()
cocaine %>% ggvis(x=~weight, y=~price, fill:="green") %>% layer_points()
cocaine %>% ggvis(x=~weight, y=~price, fill=~potency) %>% layer_points() %>% layer_smooths()

cocaine %>% ggvis(~weight, ~price, fill=~potency, size := input_slider(10, 100),
                  opacity := input_slider(0, 1)) %>% layer_points()

#ggplot(cocaine, aes(x=price)) + geom_histogram()

cocaine %>% ggvis(x=~price) %>% layer_histograms()