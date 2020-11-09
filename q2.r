library(tidyverse)
raw_data <- read.csv("flu.csv")
long_data <- tidyr::gather(raw_data, key="PrePost", value="titer", Before, After)
grouped_data  <- long_data %>%
  mutate(measure=ifelse(titer<10, 5, titer)) %>%
  group_by(strain, Age, Egg.Cell, PrePost) %>%
  summarise(GMT=exp(mean(log(measure))))
