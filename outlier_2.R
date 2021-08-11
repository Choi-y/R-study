library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

# 상자그림 확인
boxplot(mpg$hwy)

# 상자그림 값 확인
boxplot(mpg$hwy)$stats

# 결측처리
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# 결측치 제외 후 분석 수행
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))
