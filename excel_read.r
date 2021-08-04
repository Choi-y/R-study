install.packages("readxl")
library(readxl)

df_exam <- read_excel("D:/data/excel_exam.xlsx")
df_exam

mean(df_exam$english)

## 첫 행이 변수명이 아닌 경우
df_exam_novar <- read_excel("D:/data/excel_exam_novar.xlsx")
df_exam_novar

## 해결 방법
df_exam_novar_impr <- read_excel("D:/data/excel_exam_novar.xlsx", col_names=F)
df_exam_novar_impr
