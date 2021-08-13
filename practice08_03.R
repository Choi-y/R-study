library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

str(mpg)

# suv 도시 연비 높은 다섯 곳
df <- mpg %>%
  filter(class=="suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)

ggplot(data = df, aes(x= reorder(manufacturer, -mean_cty),
                      y=mean_cty)) + geom_col()

# 어떤 자동차 종류가 많은지 확인
ggplot(data=mpg, aes(x=class)) + geom_bar()
