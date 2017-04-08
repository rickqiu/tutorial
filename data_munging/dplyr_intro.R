data(diamonds, package="ggplot2")
require(dplyr)
dia <- as.tbl(diamonds)

dia[, c("carat", "price")]

# select function
dia %>% select(carat, price)
dia %>% select_('carat', 'price')
dia %>% select(1, 7)
dia %>% select(-c(1, 7))
dia %>% select(-carat, -price)


dia[dia$cut == 'Ideal', ]

# filter function
dia %>% filter(cut == 'Ideal')
dia %>% filter(cut == 'Ideal', color == 'E')
dia %>% filter(cut == 'Ideal' & color == 'E')
dia %>% filter(cut == 'Ideal' | cut == 'Premium')
dia %>% filter(cut %in% c('Ideal', 'Premium'))
dia %>% filter_("cut=='Ideal'")
dia %>% filter_(~cut=='Ideal')

# slice function
dia %>% slice(1:5)
dia %>% slice(1:10)
dia %>% slice(c(1, 3, 5:10))

# mutate function
dia %>% mutate(price/carat)
dia %>% mutate(ratio=price/carat)
dia

require(magrittr)
dia %<>% mutate(ratio=price/carat)
dia

dia %>% mutate(TotalSize=x+y+z, TwiceSize=TotalSize*2)

# summarise function
dia %>% summarise(mean(price))
dia %>% summarise(AvgPrice=mean(price))

# group_by function
dia %>% group_by(cut) %>% summarise(AvgPrice=mean(price))
dia %>% group_by(cut, color) %>% summarise(AvgPrice=mean(price))
dia %>% group_by(cut) %>% summarise(AvgPrice=mean(price), AvgCarat=mean(carat), TotalCarat=sum(carat))

# apply arbitrary functions with do
topN <- function(x, N=5)
{
  x %>% arrange(desc(price)) %>% slice(1:N)
}

topN(dia)
dia %>% do(topN(.))
dia %>% do(topN(., N=7))
dia %>% group_by(cut) %>% do(topN(., N=1))

dia %>% group_by(cut) %>% arrange(desc(price)) %>% slice(1)

models <- dia %>% group_by(cut) %>% do(Model=lm(price ~ carat, data=.))
models
class(models)
class(models$cut)
class(models$Model)
class(models$Model[[1]])
models$Model[[1]]
models$Model[[2]]
summary(models$Model[[1]])