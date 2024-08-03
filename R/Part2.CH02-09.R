# 패키지 불러오기
library(dplyr) 


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 
emp <- emp_org


# 데이터 프레임 동일성 확인 - all_equal()
all.equal(emp, emp_org)

emp1 <- emp %>%
  select("id", "ename", "dept_no", "job_level", "join_date", "base", "bonus", "gender")

all.equal(emp1, emp_org)

emp2 <- emp %>%
  filter(gender == "M")

all.equal(emp2, emp_org)  


# 직전/직후 행 확인 - lag(), lead()
emp %>%
  group_by(job_level) %>%
  summarize(avg = mean(base)) %>% 
  mutate(next_avg = lead(avg_base), 
         diff = next_avg - avg) 
         
emp %>%
  group_by(dept_no, job_level) %>%
  summarize(avg_base = mean(base)) %>%
  mutate(prev_avg_base = lag(avg_base))

df_emp <- data.frame(emp %>%
                       group_by(dept_no, job_level) %>%
                       summarize(avg = mean(base), .groups = 'drop') %>%
                       select(dept_no, job_level, avg))

df_emp %>%
  mutate(prev_avg = lag(avg))


# 순위 확인 - row_number(), min_rank(), dense_rank()
v1 <- c(20, 10, 30, 40, 50)
v2 <- c(10, 20, 30, 30, 30, 40)

row_number(v1)

row_number(v2)

min_rank(v2)

dense_rank(v2)

emp %>%
  arrange(desc(base), desc(bonus)) %>%
  mutate(rank1 = row_number(desc(base)),
         rank2 = min_rank(desc(base)),
         rank3 = dense_rank(desc(base)))


# 누적 평균 확인 - cummean()
emp %>%
  arrange(join_date) %>%
  mutate(cum_avg = cummean(base))

emp %>%
    group_by(gender) %>%
    arrange(join_date) %>%
    mutate(cum_avg = cummean(base))

emp %>%
  group_by(gender) %>%
  arrange(gender, join_date) %>%
  mutate(cum_avg = cummean(base))

