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
  
# Create subset, then graph:

db_sub <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days" , sex == "Both") 

# Create a basic line graph 
ggplot(data = db_sub, aes(x = year, y = deaths_per_100k)) +
  geom_line(aes(color = country_name))


ggsave(here("final_graphs", "disease_graphs.png"))
