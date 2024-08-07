# 라이브러리
library(tidyverse)

# 내장데이터 
anscombe

# 데이터 정리
anscombe_tidy <- anscombe %>%
  mutate(obs = row_number()) %>%
  pivot_longer(cols = -obs,
               names_to = "key",
               values_to = "value") %>%
  separate_wider_position(cols = key,
                        widths = c(variable = 1, set = 1)) %>%
  pivot_wider(names_from = variable,
              values_from = value)

# 통계값 추출
anscombe_tidy %>%
  group_by(set) %>%
  summarize(
    mean_x = mean(x),
    mean_y = mean(y),
    var_x = var(x),
    var_y = var(y),
    sd_x = sd(x),
    sd_y = sd(y),
    cor = cor(x, y)
  )

# 그래프 생성
ggplot(anscombe_tidy, aes(x, y)) +
  geom_point() +
  facet_wrap(~ set) +
  geom_smooth(method = "lm", se = FALSE)



