## 불러오기
csv_exam <- read.csv("d:/data/csv_exam.csv")
csv_exam

max(csv_exam$math)
min(csv_exam$science)

save_csv <- data.frame(english=c(90, 50, 40),
                       math=c(70,100,60),
                       class=c(1,2,3))
## 저장
write.csv