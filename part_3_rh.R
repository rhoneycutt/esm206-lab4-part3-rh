# --------------
# Randi 
# --------------

library(tidyverse)
library(janitor)
library(here)

# Read in data: 
db <- read_csv(here::here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000)
  