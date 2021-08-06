library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)

####################################################
str(midwest)

# 백분율 변수 추가
midwest <- midwest %>%
  mutate(popminor = ((poptotal-popadults)/poptotal*100))

# 백분율 높은 순으로 5개, 나라명, 백분율만 출력
#midwest %>%
#  group_by(county) %>%
#  arrange(desc(popminor)) %>%
#  head(5)

midwest %>%
  arrange(desc(popminor)) %>%
  select(county, popminor) %>%
  head(5)

# 백분율 기준으로 large, middle, small 주기
midwest <- midwest %>%
  mutate(minorgrade = ifelse(popminor >= 40, "large",
                             ifelse(popminor >= 30, "middle", "small")))

# 미성년 비율 등급 빈도표
#midwest %>%
#  group_by(minorgrade)
table(midwest$minorgrade)

# 전체 인구 대비 아시아인 인구 백분율,
# 하위 10개 지역의 state, county, 백분율 출력
midwest %>%
  mutate(ratio_asian = (popasian/poptotal)*100) %>%
  arrange(ratio_asian) %>%
  select(state, county, ratio_asian) %>%
  head(10)

###################################################