install.packages("ggplot2")
library(ggplot2)

## ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악한다
gg_midwest <- as.data.frame(ggplot2::midwest)

str(gg_midwest)
dim(gg_midwest)
View(gg_midwest)

## poptotal -> total / popasian -> asain으로 수정
install.packages("dplyr")
library(dplyr)
gg_midwest <- rename(gg_midwest, total=poptotal,
                     asian=asain)

## 전체 인구 대비 아시아 인구 백분율 파생 변수
gg_midwest$percentage <- (gg_midwest$asian / gg_midwest$total) * 100

## 히스토그램으로 도시 분포 확인
hist(gg_midwest$percentage)

## 전체 평균 구하고, 평균 초과하면 large, 아니면 small
gg_midwest$is_mean <- ifelse(gg_midwest$percentage > mean(gg_midwest$percentage), "large", "small")
gg_midwest$is_mean

## 빈도표와 막대 그래프로 확인
table(gg_midwest$is_mean)
qplot(gg_midwest$is_mean)
