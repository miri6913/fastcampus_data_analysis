# 필요한 패키지 설치
install.packages("plotly")

# 패키지 불러오기
library(plotly)
library(tidyverse)

# 박스플롯
plot_ly(mpg, x = ~drv, y = ~hwy, type = 'box', color = ~drv, #color = ~class, 
        boxmean = T, boxpoints = 'all', jitter = 0.8) %>%
  layout(boxmode = "group")


# 라인그래프
head(economics)

plot_ly(economics, x = ~date, y = ~unemploy, type = 'scatter', mode = 'lines')
        
econ <- economics_long %>%
  select(-value) %>%
  pivot_wider(names_from = variable,
              values_from = value01)

plot_ly(econ, x = ~date, y = ~unemploy, type = 'scatter', mode = 'lines',
        name = 'unemploy', line = list(color = 'black', width = 7))  %>%
  add_trace(y = ~pce, name = 'pce', 
            line = list(color = 'red', dash = 'dash')) %>%
  add_trace(y = ~psavert, name = 'psavert', mode = 'lines',
            line = list(color = 'blue', dash = 'dot')) 


plot_ly(econ, x = ~date) %>% 
  add_trace(y = ~unemploy, name = 'unemploy', type = 'scatter', mode = 'lines',
           line = list(color = 'black', width = 7)) %>%
  add_trace(y = ~pce, name = 'pce', type = 'scatter', mode = 'lines',
            line = list(color = 'red', dash = 'dash')) %>%
  add_trace(y = ~psavert, name = 'psavert', type = 'scatter', mode = 'lines',
            line = list(color = 'blue', dash = 'dot')) %>%
  layout(title = 'Economics in the US',
         xaxis = list(rangeslider = list(type = 'date')),
         yaxis = list(title = 'normalized value'))
