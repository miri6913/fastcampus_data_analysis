library(tidyverse)

head(midwest)

# 숫자 자리수 옵션
options(scipen=999) 


# 그래프 배경, 그래프 타입 및 추세선 추가
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point() + 
  geom_smooth() 


# x축, y축 조정하기 
# 1. 점 지우기 
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point() + 
  geom_smooth() + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 1000000))


# 2. 점은 나두고 선택 부분을 확대하기
ggplot(midwest, aes(x=area, y=poptotal)) +
  geom_point() + 
  geom_smooth() + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  


# 그 외 옵션 넣기
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="green", size=4) +     # 점의 크기 및 색상 조정 
  geom_smooth(method="lm", col="firebrick", size=2) +    # 추세선의 색상 및 굵기 조정
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population",    # 타이틀 지정  
       subtitle="From midwest dataset",    # 섭타이틀 지정
       y = "Population",    # y축 이름 지정
       x = "Area")     # x축 이름 지정
  
  
# 그룹별로 점 색상 변경
  ggplot(midwest, aes(x = area, y = poptotal)) +
  geom_point(aes(col = state)) +    # 그룹별로 점 색상 수정
  geom_smooth(method = 'lm', col = 'firebrick', size =2) + 
  coord_cartesian(xlim= c(0,0.1), ylim= c(0, 1000000)) +
  labs(title="Area Vs Population",      
         subtitle="From midwest dataset",    
         y = "Population",    
         x = "Area")  +   
  theme(legend.position = "None") +    # 범례삭제
  scale_color_brewer(palette = "Set1") +    # 그룹별 점의 색상 팔레트 변경
  scale_x_continuous(breaks=seq(0, 0.1, 0.01))    # x축 단위 너비 변경

                        