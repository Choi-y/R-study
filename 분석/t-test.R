# t-test
# 두 집단 평균에 통계적으로 유의한 차이가 있는지

library(ggplot2)

# compact 자동차 vs suv자동차 도시 연비 t 검정
mpg <- as.data.frame(ggplot::mpg)

library(dplyr)
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)
## --> p-value < 2.2*10^-16 이므로 유의함
## p-value가 0.05 미만이면 집단 간 차이가 통계적으로 유의하다고 봄


# 일반 휘발유와 고급 휘발유의 도시 연비 t 검정
mpg_diff2 <- mpg %>%
  select(fl, cty) %>%
  filter(fl %in% c("r", "p"))
table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)
# --> p-value가 0.05보다 크므로 통계가 유의하진 않음
# = 실제로는 차이가 없는데 우연에 의해 이러한 차이가 발생할 확률이 28.75%