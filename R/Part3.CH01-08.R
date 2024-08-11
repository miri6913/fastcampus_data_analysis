library(tidyverse)

# 하나의 그래프에서 class(차종)별 배기량과 고속도로 연비 산점도 생성
ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point()


# class(차종)별로 각각 배기량과 고속도로 연비 산점도 생성
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_wrap(~ class, ncol = 2, strip.position = 'left', scale = 'free_x')


# facet_grid()에 하나의 변수만 적었을 경우 facet_wrap과 같음
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(class ~ .)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(. ~ class)


# drv(구동방식, 3종류), class(차종, 7종류)별로 각각 배기량과 고속도로 연비 산점도 생성
ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  facet_grid(drv ~ class)

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  facet_grid(class ~ .)

