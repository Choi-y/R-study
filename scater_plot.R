# scater_plot

library(ggplot2)

# 배경 설정
# x축 = displ, y축 = hwy
ggplot(data = mpg, aes(x = displ, y = hwy))

# 그래프 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

# x축, y축 범위 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  xlim(3, 6) +
  ylim(10, 30)