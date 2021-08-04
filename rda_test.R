## 저장
test_rdata = data.frame(english=c(100,90),
                        math=c(70,80),
                        class=c(1,2))
save(test_rdata, file="rda_save_test.rda")

## 데이터 비우기
rm(test_rdata)

## 불러오기
load("rda_save_test.rda")

## 자동으로 생성됨
test_rdata