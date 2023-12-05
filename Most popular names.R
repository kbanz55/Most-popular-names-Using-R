library(tidyverse)
install.packages("babynames")
library(babynames)
library(dplyr)
library(ggplot2)
data("babynames")
babynames
view(babynames)
top_male_names <- babynames %>% filter(sex == "M", year >= 1900, year <= 1999) %>%
  group_by(name) %>% summarize(total_births = sum(n)) %>% top_n(3, total_births) 

top_male_names_data <- babynames %>% filter(sex == "M", year >= 1900, year <= 1999, name %in% 
           top_male_names$name) 

ggplot(top_male_names_data, aes(x = as.numeric(year), y = n, color = name)) +
  geom_line(size = 1.5) + labs(
    title = "Popularity of Top 3 Male Names From (1900-1999)",
    x = "Year",
    y = "Number of Births",
    color = "Name" 
  )
