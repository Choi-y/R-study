# CorrelationAnalysis (상관분석)
# 두 연속 변수가 서로 관련 있는지 검정

library(ggplot2)
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
# cor = 상관계수, 양수이므로 정비례 관계

head(mtcars)

car_cor <- cor(mtcars)
round(car_cor, 2)

# 히트맵 생성
install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
## 상관계수 클수록 원 크기 크고 색 진함,
## 상관계수 양수 - 파란색, 음수 - 빨간색

## 원 대신 상관계수로
corrplot(car_cor, method="number")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(car_cor,
         method="color", # 색으로 표현
         col=col(200), # 색상 200개
         type="lower", # 왼쪽 아래 행렬만
         order="hclust", # 유사한 상관계수끼리 군집화
         addCoef.col="black", # 상관계수 색깔
         tl.col="black", # 변수명 색깔
         tl.srt=45, # 변수명 45도 기울임
         diag=F) # 대각행렬 제외