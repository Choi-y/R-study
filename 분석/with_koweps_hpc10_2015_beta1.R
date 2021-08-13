install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "D:/data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
welfare <- raw_welfare


head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

welfare <- rename(welfare,
                  sex = h10_g3, #성별
                  birth = h10_g4, # 태어난 연도
                  marriage = h10_g10, # 혼인 상태
                  religion = h10_g11, # 종교
                  income = p1002_8aq1, # 월급
                  code_job = h10_eco9, # 직업 코드
                  code_region = h10_reg7) #지역코드

# 성별 변수 검토 및 전처리
class(welfare$sex)
table(welfare$sex)

table(is.na(welfare$sex))

welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

qplot(welfare$sex)


# 월급 변수 검토하기
class(welfare$income)
summary(welfare$income)

qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)

# 이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)

table(is.na(welfare$income))

sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x=sex, y=mean_income)) + geom_col()


# 나이 변수 검토 및 전처리
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

table(is.na(welfare$birth))

# 만약 결측치가 있을 경우 -- 지금은 X
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)

# 파생변수 생성
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

qplot(welfare$age)


# 나이와 월급 관계 분석
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data=age_income, aes(x=age,y=mean_income)) + geom_line()


# 연령대에 따른 월급 차이

# 파생변수 만들기 - 연령대
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))
ageg_income

ggplot(data = ageg_income, aes(x=ageg, y=mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))


# 연령대 및 성별 월급 차이
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))


# 나이 및 성별 월급 평균표
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))
head(sex_age)

ggplot(data=sex_age, aes(x=age, y=mean_income, col=sex)) + geom_line()


# 직업별 월급 차이

# 직업 변수 검토 및 전처리
class(welfare$code_job)
table(welfare$code_job)

library(readxl)
list_job <- read_excel("D:/data/Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)

dim(list_job)


welfare <- left_join(welfare, list_job, id="code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)


# 직업별 월급 평균표
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

top10


# 그래프
ggplot(data=top10, aes(x=reorder(job, mean_income), y=mean_income)) +
  geom_col() +
  coord_flip()


# 하위 10개
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

ggplot(data=bottom10, aes(x=reorder(job, -mean_income), y=mean_income)) +
  geom_col() +
  coord_flip() +
  ylim(0, 850)

## 240p ~