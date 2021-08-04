exam <- read.csv("d:/data/csv_exam.csv")
exam

head(exam) ## ~6행까지 출력
head(exam, 3) ## 3행까지 출력

tail(exam) ## 뒤에서부터 6개
tail(exam, 2) ## 뒤에서 2개

View(exam)

dim(exam) # 행, 열 출력됨

str(exam) # 데이터 속성 파악

summary(exam) # 값을 요약해서 정리

## summary
## Min - 최솟값
## 1st Qu - 1사분위수(하위 25%, 1/4 지점)
## Median - 중앙값
## Mean - 평균
## 3rd Qu - 3사분위수(하위 75%, 3/4 지점)
## Max - 최댓값