# 패키지 불러오기
library(dplyr) 

# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 

emp <- emp_org
head(emp)

# 빌트인 함수
month.name

# 샘플 데이터셋
m1 <- data.frame(id = 1:4, 
                 name = month.name[1:4])
m2 <- data.frame(id = 3:7, 
                 name = month.name[3:7])
m3 <- data.frame(id = 3:7, 
                 name = month.name[3:7],
                 kname = c("3월", "4월", "5월", "6월", "7월"))

# 행 합치기
rbind(m1, m2)
rbind(m1, m3)
bind_rows(m1, m3)

# set operations
union(m1, m2)

intersect(m1, m2)

setdiff(m1, m2)
setdiff(m2, m1)

# 열 순서 변경
m2 <- data.frame(name = month.name[3:7],
                 id = 3:7)

intersect(m1, m2)
union(m1, m2)
setdiff(m1, m2)

m2 <- data.frame(mon_nm = month.name[3:7],
                 id = 3:7)

intersect(m1, m2)
union(m1, m2)
setdiff(m1, m2)

# 예제
new_emp1 <-data.frame(id = c(6701, 6702, 6703),
                      ename = c("jyang", "kkim", "olee"),
                      dept_no = c(10, 30, 30),
                      job_level = c(3, 2, 1),
                      join_date = c("2023-08-01", "2023-08-01", "2023-08-01"),
                      gender = c("M", "F", "M"),
                      base = c(3500, 5000, 5500), 
                      bonus = c(100, 150, 100))

new_emp2 <- data.frame(id = 6704:6706,
                       ename = c("mkim", "ylee", "oyeom"),
                       gender = c("F", "F", "M"))

all_emp <- union(emp, new_emp1)
union(emp, new_emp2)

all_emp <- bind_rows(emp, new_emp2)

a <- all_emp %>%
  filter(id %in% c(6003, 6163, 6018, 6302, 6224))

b <- all_emp %>%
  filter(dept_no %in% c(30, 40))

intersect(a, b) # 프로젝트 1과 프로젝트 2를 둘 다 하는 사람만 뽑을 때 
union(a, b) # 프로젝트를 하는 모든 사람을 뽑을 때 
setdiff(a, b) # 프로젝트 a만 하는 사람을 뽑을 때 
setdiff(b, a) # 프로젝트 b만 하는 사람을 뽑을 때 

