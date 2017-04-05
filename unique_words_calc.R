
library(tidyverse)
library(tidytext)
library(magrittr)

# get words into dataframe
blog_words <-
  data_frame(lines = readLines('i_am_no_doctor.txt')) %>% 
  mutate(line_number = row_number()) %>%
  unnest_tokens(word, lines)

# number of distinct words
blog_words %>% 
  distinct(word)

# distribution of positive and negative words
blog_words %>%
  left_join(get_sentiments("bing")) %>% 
  filter(!is.na(sentiment)) %>% 
  ggplot(., aes(sentiment)) +
  geom_bar()
