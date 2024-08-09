library(tidyverse)

# 빈도수 막대그래프
ggplot(mpg, aes(x = manufacturer)) +
  geom_bar(fill='green',
           color='black',
           width = 0.4) +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# x, y축 변경
ggplot(mpg, aes(x = manufacturer)) +
  geom_bar(fill='green',
           color='black',
           width = 0.4) +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  coord_flip()


# 제조사별, 구동방식별로 구분한 라인데이터
# 1. 누적 그래프
ggplot(mpg, aes(x = manufacturer, fill = drv)) +
  geom_bar(position = "stack") +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  coord_flip()

# 2. 비율 그래프
ggplot(mpg, aes(x = manufacturer, fill = drv)) +
  geom_bar(position = "fill") +
  labs(x = "Manufacturer",
       title = "Bar Chart of Manufacturers") +
  coord_flip()


# 평균 막대그래프
class_hwy <- mpg %>%
  group_by(class) %>%
  summarize(avg_hwy = mean(hwy))

ggplot(class_hwy, aes(x = class, y = avg_hwy)) + 
  geom_col() +
  labs(title = "Average Highway MPG by Type of Car",
       x = 'Type of Car',
       y = 'Average Highway MPG') 


# x축 순서 바꿈
ggplot(class_hwy, aes(x = reorder(class, -avg_hwy), y = avg_hwy)) + 
  geom_col() +
  labs(title = "Average Highway MPG by Type of Car",
       x = 'Type of Car',
       y = 'Average Highway MPG') 


# 2개 이상의 평균이 있을 때 막대그래프
# 1. 데이터 형태 롱포맷으로 변경
mpg_long <- mpg %>%
  group_by(class) %>%
  summarize(avg_hwy = mean(hwy),
            avg_cty = mean(cty)) %>%
  pivot_longer(cols = -class)


# 2. 위의 데이터로 그래프 생성
ggplot(mpg_long, aes(x = class, y = value, fill = name)) +
  geom_col(position = 'dodge')

ggplot(mpg_long, aes(x = class, y = value, fill = name)) +  
  geom_col(position = 'identity')


