library(tidyverse)


# 박스플롯
ggplot(mpg, aes(x = drv, y = hwy, fill = drv)) +
  geom_boxplot(varwidth = T, 
               notch = T,
               outlier.color ='red',    
               outlier.shape = 'square', 
               outlier.size = 3) +
  labs(x = "Type of Drive Train",
       y = "Highway MPG",
       title = "Box Plot of Highway MPG by Type of Drive Train") +
  geom_jitter()  


table(mpg$drv)