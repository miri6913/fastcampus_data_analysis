# 패키지 설치 및 불러오기
install.packages("dplyr")
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 
emp_org

emp <- emp_org


# 열 선택 - select
emp %>% select(ename)

emp %>% select(gender)

emp %>% select(ename, gender)

emp %>% select(-bonus)

emp %>% select(-base, -bonus)

dept30 <- emp %>% 
  filter(dept_no == 30)

dept30 %>% select(bonus)

emp %>% filter(dept_no == 30) %>% select(bonus)

emp %>% 
  filter(dept_no == 30) %>% 
  select(bonus)

emp %>% 
  filter(dept_no == 10) %>% 
  select(bonus) %>%
  head

