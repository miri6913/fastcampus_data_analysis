## 패키지 설치 및 불러오기
install.packages("tidyverse")

library(tidyverse)
tidyverse_packages()


# 결측치 찾기
stu1 <- data.frame(name = c('Hwayoung',	NA,	'Sua',	'Sojin',	'Minjeong',	'Gaeun',	'Janghoon',	'Sunghoon',	'Jaeyoung',	'Yeseung',	'Jungjae',	'Kyunghwan'),
                   class = c(1, 2, 3, 2, 3, 1, 1, 2, 3, 3, 2, 2),
                   math = c(74, 56, NA, 57, 42, 39, 55, 68, NA, 83, 92, 71),
                   eng = c(76, 70, 77, 68, NA, 63, 70, NA, 95, NA, 100, 65))

stu1

anyNA(stu1)

is.na(stu1)

table(is.na(stu1))

table(is.na(stu1$math))


# 1. 결측치 제외
# math 열  체크
stu1 %>% 
  filter(is.na(math))

stu1_ed <- stu1 %>% 
  filter(!is.na(math))

stu1 %>%
  drop_na(math)


# math, eng 열 체크
stu1 %>% 
  filter(!is.na(math) & !is.na(eng))

stu1 %>%
  drop_na(math, eng)

na.omit(stu1)

drop_na(stu1)

# 모든 열 체크 

stu2 <- data.frame(stu1, 
                   gender = c('f', NA, NA, NA, NA, NA, 'm', NA, NA, NA, NA, NA))

drop_na(stu2)

# 함수에 결측치 제거 파라미터가 있는 경우
mean(stu2$math)

mean(stu2$math, na.rm = T)

stu2 %>%
  summarize(avg_math = mean(math, na.rm = T))


# 2. 결측치 대체
# 위에 있는 값으로 지정
stu2

stu2 %>%
  fill(math, eng)

# 밑으로 채움
stu2 %>%
  fill(gender, .direction = "down")

# replace_na()
# 특정 숫자 지정
stu2 %>% 
  replace_na(list(math = 10))

stu2 %>% 
  replace_na(list(math = 0, eng = 10))

# 평균값 지정
stu2 %>%
  mutate(math = ifelse(is.na(math), mean(math, na.rm =T), math))

avg = mean(stu2$math, na.rm = T)

stu2 %>% 
  replace_na(list(math = avg))
