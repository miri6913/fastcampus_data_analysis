library(tidyverse)

# 샘플 데이터
head(economics)
head(economics_long)

summary(economics)


# 라인그래프
ggplot(economics, aes(date, unemploy)) + 
  geom_line(color = "red") + 
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Number of Unemployed Over Time",
       x = "date",
       y = "number of unemployed in thousands")
  theme(panel.grid.major.x = element_line(color = 'black'),
        panel.grid.minor.y = element_blank()) 


# 여러개의 라인그래프
ggplot(economics_long, aes(date, value01, colour = variable)) +
  geom_line() +
  theme_bw()


