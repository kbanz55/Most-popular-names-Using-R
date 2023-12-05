library(tidyverse)
install.packages("babynames")
library(babynames)
babynames
view(babynames)
babynames %>% filter(sex == "M", year >= 1900, year <= 1999) %>%
  group_by(name) %>% summarize(total_births = sum(n)) %>%
  top_n(3, total_births) 
view(babynames %>% filter(sex == "M", year >= 1900, year <= 1999) %>%
       group_by(name) %>% summarize(total_births = sum(n)) %>%
       top_n(3, total_births))

