# 패키지 설치 및 불러오기
install.packages("dplyr")
library(dplyr)


# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 
emp_org

emp <- emp_org


# 데이터 요약 - group_by(), summarize()
emp %>%
  summarize(avg_base = mean(base))

mean(emp$base)

emp %>%
  group_by(dept_no) %>%
  summarize(avg_base = mean(base))

emp %>%
  group_by(dept_no) %>%
  summarize(avg_base = mean(base),
            med_base = median(base),
            sum_bonus = sum(bonus),
            no_ppl = n())

emp %>%
  group_by(dept_no, gender) %>%
  summarize(avg_base = mean(base))

emp %>%
  group_by(dept_no, gender, job_level) %>%
  summarize(avg_base = mean(base))

emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior")) %>%
  group_by(dept_no, gender, job_level_name) %>%
  summarize(avg_base = mean(base))

emp %>%
  mutate(job_level_name = ifelse(job_level <= 2, "junior", "senior")) %>%
  group_by(dept_no, job_level_name, gender) %>%
  summarize(avg_base = mean(base))

# 부서번호 30 제외 - filter
# 각 부서별 - group by
# 베이스 + 보너스 - mutate
# 평균 - summarize
# 연봉이 가장 높은 - arrange(desc) 
# 부서 번호만 출력 - select
# 가장 높은 부서 번호 하나만 출력 head(1)

emp %>%
  filter(dept_no != 30) %>%
  group_by(dept_no) %>%
  mutate(total = base + bonus) %>%
  summarize(avg_total = mean(total)) %>%
  arrange(desc(avg_total)) %>%
  select(dept_no) %>%
  head(1)



