library(ggplot2)

econ <- as.data.frame(ggplot2::economics)

# x축 - date(시간), y축 - unemploy(실업자 수)
ggplot(data = econ, aes(x=date,y=unemploy)) + geom_line()

ggplot(data = econ, aes(x=date,y=psavert)) + geom_line()
