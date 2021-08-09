df <- data.frame(sex=c("M", "F", "M", NA, "F"),
                 score=c(70,90,80,60,NA))
df

is.na(df)

table(is.na(df))
table(is.na(df$score))

### 결측치 있는 행 출력
library(dplyr)

df %>% filter(is.na(score))
df %>% filter(!is.na(score))

# 결측치 없는 새로운 데이터 프레임 생성
df_nomiss <- df %>% filter(!is.na(score))
df_nomiss

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

exam <- read.csv("D:/data/csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

