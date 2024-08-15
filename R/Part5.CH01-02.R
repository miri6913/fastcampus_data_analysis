library(tidyverse)

mql <- read.csv('olist_marketing_qualified_leads_dataset.csv')
cd <- read.csv('olist_closed_deals_dataset.csv')

# 판매자로 가입한 고객 데이터 확인 
head(mql)

tail(mql)

str(mql)

summary(mql)

# 데이터 타입 변경
mql <- mql %>% 
  mutate(first_contact_date = ymd(first_contact_date))

# origion별 -- ""이 있음(60)
mql %>% 
  group_by(origin) %>% 
  summarise(cnt = n(),
            pct = cnt / 80000) %>% 
  arrange(desc(cnt))

# 결측치 제거
mql <- mql %>% 
  filter(origin != "")

# 판매자로 전환된 고객 데이터 확인
head(cd)
tail(cd)
summary(cd)

# 이상치 확인 
colSums(is.na(cd))
  

# 데이터 타입 변경
cd <- cd %>%
  mutate(won_date = as.Date(ymd_hms(won_date))) 


# 리드타입별
cd %>% 
  group_by(lead_type) %>% 
  summarise(cnt= n()) %>% 
  arrange(desc(cnt)) %>%
  ggplot(aes(x = lead_type, y = cnt)) +
  geom_col()


# 비지니스 타입별 -- ""이 있음(10)
cd %>% 
  group_by(business_type) %>% 
  summarise(cnt = n()) %>% 
  arrange(desc(cnt))


# 비지니스 세그먼트별 -- ""이 있음(10)
cd %>% 
  group_by(business_segment) %>% 
  summarise(cnt = n()) %>%
  mutate(pct = cnt / sum(cnt)) %>% 
  arrange(desc(cnt))


# "" 데이터 확인 및 삭제
cd %>%
  filter(business_segment == "" | business_type == "" | lead_type == "")

cd <- cd %>%
  filter(business_segment != "" & business_type != "" & lead_type != "")


## 데이터 병합
mql_cd <- mql %>% 
  left_join(cd, by = 'mql_id')


# 유입채널별 판매자 전환율
mql_cd %>%
  group_by(origin) %>%
  summarize(mqls = n(),
            sellers = sum(ifelse(is.na(seller_id),0,1)),
            conversion = sellers/mqls) %>%
  arrange(desc(conversion))


# 랜딩 페이지별 전환율
mql_cd %>% 
  group_by(landing_page_id) %>% 
  summarise(sellers = sum(ifelse(is.na(seller_id), 0, 1))) %>% 
  mutate(conversion = sellers / sum(sellers)) %>%
  arrange(desc(conversion))


# 영업담당자별 전환시키는데 걸리는 시간
mql_cd %>%
  filter(!is.na(seller_id)) %>%
  mutate(duration = won_date - first_contact_date) %>%
  group_by(sr_id) %>%
  mutate(avg_duration = mean(duration, na.rm=T),
         sellers = n()) %>%
  distinct(sr_id, avg_duration, sellers) %>%
  arrange(avg_duration)

