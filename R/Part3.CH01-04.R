library(tidyverse)


# 히스토그램
ggplot(mpg, aes(x = hwy)) +
  geom_histogram() +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


# 빈 갯수 설정
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(bins = 6, 
                 fill = "blue", 
                 color = "black") +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


# 빈 넓이 설정
ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 5, 
                 fill = "blue", 
                 color = "black") +
  labs(title = "Histogram of Highway MPG", 
       x = "Highway MPG")


# 데이터 형태 확인
str(mpg)


# 구동방식별 고속도로연비 분포
ggplot(mpg, aes(x = hwy,
                fill = factor(drv)))+
  geom_histogram(binwidth = 5, 
                 position = 'identity',
                 alpha = 0.6) +
  labs(title = "Histogram of Highway MPG by drive train",
       x = "Highway MPG") +
  scale_fill_manual(values = c("4" = "blue", "f" = "green", "r" = "red"),
                    breaks = c("4", "f", "r"),
                    labels = c("front-wheel drive", "rear wheel drive", "4wd")) 

