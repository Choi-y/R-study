## 패키지
install.packages("plotly")
library(plotly)

library(ggplot2)
p <- ggplot(data=mpg, aes(x=displ, y=hwy, col=drv)) + geom_point()

# 산점도 그래프
ggplotly(p)


## 인터랙티브 막대그래프
p <- ggplot(data = diamonds, aes(x=cut, fill=clarity)) + geom_bar(position = "dodge")
ggplotly(p)
