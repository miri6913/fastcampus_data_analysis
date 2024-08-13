library(tidyverse)


# 내장형 함수
as.Date('2023-05-10')
as.Date('2023/05/10')


# 내장형 함수가 제대로 작동하지 않는 경우 - 위를 제외한 모든 경우
# 예시 1. 숫자로 되어있는 경우
as.Date(20230510) 

# 예시 2. 연도가 2자리
as.Date('23-05-10')

# 예시 3. 년-월-일의 순서가 아님
as.Date('05-10-2023') 

# 예시 4. 구분자가 없거나 -,/가 아님
as.Date('20230510') 
as.Date('2023.05.10') 


# lubridate 함수
# 년(y)월(m)일(d)순서에 따라 함수를 적으면 됨
ymd('20230510')

dmy('10,05,2023')

mdy('05102023')

ymd('230510')

mdy('05-10-2023')

mdy('May 10th 2023')

mdy('5월 10일 2023년')

ymd(230510)


# 날짜의 년/월/일/주 추출
dt1 <- ymd(20230722)
dt2 <- ymd(20221015)

year(dt1)

month(dt1)

day(dt1)

week(dt1)

wday(dt1) # 일요일~토요일을 1~7

wday(dt1, label = TRUE)

yday(dt1)


# 날짜 계산
dt1 + days(10)

dt1 + months(5)

dt1 + years(2)

dt1 - dt2

year(dt1) - year(dt2)

as.period(dt2 %--% dt1)

as.duration(dt2 %--% dt1)

(months(3) + days(2)) * 5


# 윤달
leap_year(2005)

leap_year(2008)


#오늘
today() # 날짜만

now() # 날짜와 시간


# 시간
hms('20:15:18')

hms('20,15,18')

hms('20*15*18')

hm('20:15')

ymd_hm('2015-09-18 09:24')



# 시간 계산
tm1 <- hms('15:24:17')
tm2 <- hms('04:41:58')

hour(tm1)

minute(tm1)

second(tm1)

hm('20,15') + minutes(55)

tm2 + seconds(20)

tm1 + tm2


# 아침/저녁 확인
am(hm1)
pm(hm1)


# 시간대
Sys.timezone() #현재 R가 어떤 시간대를 사용
dt1_hm <- ymd_hm('20230430 14:30')

dt2_hm <- ymd_hm('20230430 14:30', tz='Asia/Seoul')

dt1_hm == dt2_hm

with_tz(dt1_hm, "Asia/Seoul")

dt1_hm + hours(9) == dt2_hm 


# 날짜/시간의 반올림
round_date(dt1_hm, unit='year')

round_date(dt1_hm, unit='month')


# 올림
ceiling_date(dt1_hm, unit='hour')


#내림
floor_date(dt1_hm, unit='minute')


