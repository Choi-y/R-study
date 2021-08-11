library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39,42)

## drv 이상치 유무 확인
table(mpg$drv)

# 결측 처리
mpg$drv <- ifelse(mpg$drv %in% c("f", "r", 4), mpg$drv, NA)

# 이상치 유무 확인
table(mpg$drv)


# 상자 그림으로 cty에 이상치 유무 확인
boxplot(mpg$cty)
boxplot(mpg$cty)$stats

# 정상 범위 벗어난 값 결측 처리
mpg$cty <- ifelse(mpg$cty < 26 & mpg$cty > 9, mpg$cty, NA)

# 극단치 유무 확인
boxplot(mpg$cty)


# 이상치 제외한 다음, drv별로 cty 평균이 어떻게 다른지
library(dplyr)

mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty, na.rm = T))

mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%
  group_by(drv) %>%
  summarise(cty_mean = mean(cty))
