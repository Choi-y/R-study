# R 64bit 실행(rstudio 실행도 가능) 

# java, rJava 설치 install.packages("multilinguer")
# 이때 mac 사용자는 데스크탑 비밀번호를 물어봅니다. 입력해줘야 설치가 진행됩니다.
install.packages("multilinguer")
library(multilinguer)
install_jdk()
# 위 함수에서 에러가 발생하면 알려주세요
# https://github.com/mrchypark/multilinguer/issues

# 의존성 패키지 설치
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

devtools::install_github('haven-jeon/NIADic/NIADic', build_vignettes = FALSE)

# github 버전 설치
install.packages("remotes")
# 64bit 에서만 동작합니다.
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))

install.packages("KoNLP")
library(KoNLP)
library(rJava)
library(dplyr)

#####################################################

buildDictionary(ext_dic = "woorimalsam")
useNIADic()

txt <- readLines("D:/data/ASAP.txt", encoding="UTF-8")
head(txt)

# 특수문자 제거
install.packages("stringr")
library(stringr)

txt <- str_replace_all(txt, "\\W", " ")


## 명사 추출
extractNoun("안녕하세요 패키지 설치가 안 돼서 화납니다")

nouns <- extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

df_word <- filter(df_word, nchar(word) >= 2)

top_20 <- df_word %>%
  arrange(desc(freq)) %>%
  head(20)

top_20


## 워드클라우드 만들기
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)


#####################################

mago <- readLines("D:/data/mago.txt", encoding="UTF-8")
head(mago)

# 특수문자 제거
install.packages("stringr")
library(stringr)

mago <- str_replace_all(mago, "\\W", " ")


## 명사 추출
extractNoun("안녕하세요 패키지 설치가 안 돼서 화납니다")

nouns_mago <- extractNoun(mago)
wordcount_mago <- table(unlist(nouns_mago))
df_word_mago <- as.data.frame(wordcount_mago, stringsAsFactors = F)
df_word_mago <- rename(df_word_mago,
                  word = Var1,
                  freq = Freq)

df_word_mago <- filter(df_word_mago, nchar(word) >= 2)

top_20_mago <- df_word_mago %>%
  arrange(desc(freq)) %>%
  head(20)

top_20_mago


## 워드클라우드 만들기
install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)

pal <- brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word_mago$word,
          freq = df_word_mago$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)


## 빈도 막대그래프로 확인
library(ggplot2)
order <- arrange(top_20_mago, freq)$word
ggplot(data=top_20_mago, aes(x=word,y=freq)) +
  ylim(0,20) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limit=order) +
  geom_text(aes(label = freq), hjust = -0.3)
