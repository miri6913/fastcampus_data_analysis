# 패키지 불러오기
library(dplyr) 

# 데이터 불러오기 및 복사본 생성
emp_org <- read.csv("/Users/jen/documents/emp.csv") 

emp <- emp_org
head(emp)

# 빌트인 함수
month.name
month.abb

# 샘플 데이터셋
m1 <- data.frame(id = 1:3, 
                 name = month.name[1:3])
m2 <- data.frame(id = 4:12, 
                 name = month.name[4:12])
a1 <- data.frame(abb = month.abb[1:3])
a2 <- data.frame(abb = month.abb[2:5])

# 행 합치기
rbind(m1, m2)

# m1에 새로운 열 추가
m1 <- data.frame(id = 1:3,
                 name = month.name[1:3],
                 kname = c("1월","2월","3월"))

rbind(m1, m2)
bind_rows(m1, m2)

# m1에 열 순서 바꾸기 
m1 <- data.frame(id = 1:3,
                 kname = c("1월","2월","3월"),
                 name = month.name[1:3])

bind_rows(m1, m2)

# 열 합치기
cbind(m1, a1)
cbind(m2, a2)
bind_cols(m2, a2)

# join 예제 1
a2 <- data.frame(add = month.abb[2:5],
                 id = 2:5)

left_join(m2, a2, by = "id")

m2
a2

inner_join(m2, a2, by = "id")
full_join(m2, a2, by = "id")
left_join(m2, a2, by = "id")
right_join(m2, a2, by = "id")

a2 <- data.frame(add = month.abb[2:5],
                 num = 2:5)

inner_join(m2, a2, by = c("id" = "num"))

# join 변수명 2개 이상 연결
d1 <- data.frame(name = c("Minji", "Sojin", "Hyunwoo", "Kitae"),
                 bday = c("1980-01-02", "1982-05-06", "1988-02-04", "1993-04-07"),
                 job = c("Accountant", "Analyst", "Devloper", "CEO"))

d2 <- data.frame(name = c("Minji", "Sojin", "Hyunwoo", "Kitae"),
                 bday = c("2001-03-30", "1982-05-06", "2003-09-22", "1993-04-07"),
                 city = c("Seoul", "Daegu", "Gwangju", "Jeju"))

inner_join(d1, d2, by = c("name", "bday"))

# join 예제 2
dept <- data.frame(dept_no = c(10, 30, 40, 50),
                   dept_name = c("Sales", "Operation", "HR", "Research"))

loc <- data.frame(dept_no = c(10, 30, 40, 50, 60),
                  location = c("Seoul", "Incheon", "Busan", "Jeonju", "Daejeon"))

extra_info <- full_join(dept, loc, by = "dept_no")

inner_join(emp, extra_info, by = "dept_no")
left_join(emp, extra_info, by = "dept_no")
