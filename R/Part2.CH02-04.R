# 패키지 설치 및 불러오기
install.packages("dplyr")
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 
emp_org

emp <- emp_org


# 열 정렬 - arrange
emp %>%
  arrange(id)

emp %>%
  arrange(desc(base))

emp %>%
  arrange(dept_no, join_date)

emp %>%
  arrange(join_date, dept_no)

emp %>%
  arrange(desc(job_level), desc(base), join_date)

emp %>%
  filter(dept_no %in% c(10, 40)) %>%
  select(id, ename) %>%
  arrange(desc(id))

emp %>%
  filter((dept_no == 10 & job_level <=2) | (dept_no %in% c(20, 30) & job_level >= 4)) %>%
  select(ename, dept_no, job_level, join_date) %>%
  arrange(desc(job_level), join_date)




