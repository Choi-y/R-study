## 단계 구분도 생성 패키지
install.packages("ggiraphExtra")
library(ggiraphExtra)

## 미국 주별 범죄 데이터 (1973년)
str(USArrests)

head(USArrests)

library(tibble)

## 행 이름을 state로 바꿔 새 데이터 프레임 생성
crime <- rownames_to_column(USArrests, var="state")
crime$state <- tolower(crime$state)

str(crime)

library(ggplot2)
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map)

# 마우스 움직임에 반응하는 인터랙티브 단계 구분도
ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = states_map,
             interactive = T)
