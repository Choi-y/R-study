library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

ggplot(data=mpg, aes(x=drv,y=hwy)) + geom_boxplot()
