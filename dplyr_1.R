library(dplyr)

exam <- read.csv("d:/data/csv_exam.csv")
exam

## filter() 함수 이용, 1반 학생만 추출
exam %>% filter(class == 1)

## 수학 점수 50점 미만 
exam %>% filter(math < 50)

## 여러 조건
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 1 | class == 2)

## %in% 사용
exam %>% filter(class %in% c(1,3,5))

## 추출해서 변수 만들기
class1 <- exam %>% filter(class == 1)
class1

## select() 함수 이용, 필요한 변수(열) 추출
exam %>% select(math)

## 변수 제외하기
exam %>% select(-english, math)

## filter, select 조합 사용
exam %>% filter(class == 1) %>% select(science)

## arrange()로 정렬
exam %>% arrange(math)

## 내림차순
exam %>% arrange(desc(math))

exam %>% arrange(class, math)


## mutate() 함수 이용, 파생변수 추가
exam %>%
  mutate(total = math+english+science) %>%
  head

## mutate에 ifelese 더하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head

## mutate에 dplyr 바로 적용
exam %>%
  mutate(avg = (math+english+science)/3) %>%
  arrange(avg) %>%
  head


## summarise() - 요약 // 이렇게는 잘 안 쓰임
exam %>% summarise(mean_math = mean(math))

## summarise + group_by 조합
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())