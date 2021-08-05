install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)


summary(mpg$total)
hist(mpg$total)

# 조건문
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

# 빈도표 생성
table(mpg$test)

qplot(mpg$test)

## 중첩조건문
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg$grade, 20)
