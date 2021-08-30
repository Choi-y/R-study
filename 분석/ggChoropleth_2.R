install.packages("stringi")
install.packages("devtools")

devtools::install_github("cardiomoon/kormaps2014")

library(kormaps2014)

## 시도별 위도, 경도 정보 담긴 kormap1 이용
str(changeCode(korpop1))

library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

str(changeCode(kormap1))

install.packages("ggiraphExtra")
library(ggiraphExtra)
library(ggplot2)

## 단계 구분도 생성
ggChoropleth(data = korpop1,
             aes(fill = pop,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)

## 한글 깨질 때
korpop1$name <- iconv(korpop1$name, "UTF-8","CP949")

## 시도별 결핵 환자 수
str(changeCode(tbc))
ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = code,
                 tooltip = name),
             map = kormap1,
             interactive = T)

tbc$name <- iconv(tbc$name, "UTF-8","CP949")
