# 필요한 패키지 설치
install.packages("plotly")


# 패키지 불러오기
library(plotly)
library(tidyverse)

# ggplot2로 생성한 그래프를 인터랙티브 그래프로 변경
p <- ggplot(mpg, aes(x = displ, y = hwy, col = drv)) +
  geom_point()

plot(p)

ggplotly(p)


# plotly 문법을 사용하여 인터랙티브 그래프 생성
# 스캐터플롯
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = 'scatter', mode = 'markers')


# 스타일 추가
plot_ly(mpg, x = ~displ, y = ~hwy,
        type = 'scatter', mode = 'markers',
        marker = list(size = 6,
                      color = 'green',
                      line = list(color = 'red', width = 2)))


plot_ly(mpg, x = ~displ, y = ~hwy, symbol = ~drv, #color = ~drv,
        type = 'scatter', mode = 'markers') %>%
  layout(title = 'interactive scatter plot', 
         xaxis = list(title = 'highway MPG'), 
         yaxis = list(title = 'displacement') )


# 막대 그래프
new_mpg <- mpg %>%
  group_by(manufacturer, drv) %>%
  summarize(cnt = n())
  

plot_ly(new_mpg, x = ~manufacturer, y = ~cnt, color = ~drv, 
        type = 'bar') %>%
  layout(title = 'interactive bar graph', 
         xaxis = list(title = 'manufacturer'), 
         yaxis = list(title = 'count'), 
         barmode = 'group')


new_mpg <- mpg %>%
  group_by(manufacturer) %>%
  summarize(cnt = n(),
            avg_hwy = mean(hwy),
            avg_cty = mean(cty))


g1 <- new_mpg %>%
  plot_ly(y = ~manufacturer, x = ~avg_hwy, type = 'bar',
          name = 'highway MPG')  %>% 
  layout(title = 'highway MPG',
         yaxis = list(categoryorder = "total ascending"))


g2 <- new_mpg %>%
  plot_ly(y = ~manufacturer, x = ~avg_cty, type = 'bar', 
          name = 'city MPG')  %>% 
  layout(title = 'city MPG',
         yaxis = list(categoryorder = "total ascending"))


subplot(g1, g2, nrows = 1) %>% 
  layout(title = 'MPG by Manufacturers',
         legend=list(orientation = 'h'))

