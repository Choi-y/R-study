outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier

# 이상치 확인
table(outlier$sex)
table(outlier$score)

# 결측 처리
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

outlier$score <- ifelse(outlier$score == 6, NA, outlier$score)
outlier

library(dplyr)

# 분석할 때 결측치 제외하기
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))
