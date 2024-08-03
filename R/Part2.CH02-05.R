# 패키지 설치 및 불러오기
install.packages("dplyr")
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 
emp_org

emp <- emp_org


# 열 추가 및 수정 - mutate
emp %>%
  mutate(total = base + bonus) %>%
  head

emp %>%
  mutate(special_bonus = base * 0.1) %>%
  head

head(emp)

emp$total <- emp$base + emp$bonus
head(emp)

emp$special_bonus <- emp$base * 0.1
head(emp)

emp$total <- NULL
head(emp)

emp$special_bonus <- NA
head(emp)

emp <- emp %>%
  select(-special_bonus)

head(emp)

emp %>%
  mutate(special_bonus = total * 0.1,
         total = base + bonus)

emp %>%
  mutate(is_new = ifelse(join_date > "2022-03-01", "Y", "N")) %>%
  select(ename, is_new)

emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior"),
         signing_bonus = ifelse(join_date >= " 2023-01-01" & join_date <= "2023-12-31", 200, 0),
         comission = ifelse(dept_no == 10 & job_level_name == "senior", 400, 0),
         total = base + bonus + signing_bonus + comission) %>%
  filter(total > 6000) %>%
  select(ename, total) %>%
  arrange(desc(total))



