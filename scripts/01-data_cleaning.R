#### Preamble ####
# Purpose: Clean the data extracted from Canadian General Social Survey
# Author: Yuxuan Yang
# Data: 16 April 2022
# Contact: yuxuanmaggie.yang@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!



#### Workspace setup ####

library(janitor)
library(tidyverse)
library(dplyr)
# Read in the raw data 
raw_data_start <- readxl::read_excel("inputs/data/raw_data.xlsx")
# Just keep some variables that may be of interest (change 
# this depending on your interests)



# Clean variables names
cleaned_data <- raw_data_start %>% 
  clean_names() %>%
  rename(age_group_reach_CA = agearr10,
         age_group = agegr10,
         marital_status = marstat,
         num_child = chinhsdc,
         have_child = cxrflag,
         province = prv,
         smoke_status = smk_05,
         drink_status = drr_110,
         stress_level = smg_01,
         health_level = dos_02,
         living_standard = dos_01,
         job_satisfaction = jsr_02,
         discrimination = dbh_02,
         health_awareness = spa_50,
         eat_habits = heh_01,
         social_class = psc_01,
         income = ttlincg2)

data_cleaned <- cleaned_data %>%
  filter(age_group_reach_CA <= 7,
         marital_status != 96,
         smoke_status <= 3,
         drink_status <= 7,
         stress_level <= 5,
         health_level <= 10,
         living_standard <= 10,
         job_satisfaction <= 5,
         eat_habits <= 7,
         social_class <= 5) %>%
  mutate(Gender = ifelse(sex == 1, "male", "female")) %>%
  mutate(stress = case_when(stress_level == 1 ~"Not at all stressful",
                            stress_level == 2 ~ "Not very stressful",
                            stress_level == 3 ~ "A bit stressful",
                            stress_level == 4 ~ "Quite A bit stressful",
                            TRUE ~ "Extremely stressful")) %>%
  mutate(health = case_when(health_level == 0 ~"Not at all satisfied",
                            health_level == 1 ~ "level 1",
                            health_level == 2 ~ "level 2",
                            health_level == 3 ~ "level 3",
                            health_level == 4 ~ "level 4",
                            health_level == 5 ~ "level 5",
                            health_level == 6 ~ "level 6",
                            health_level == 7 ~ "level 7",
                            health_level == 8 ~ "level 8",
                            health_level == 9 ~ "level 9",
                            TRUE ~ "Completely satisfied"))
  

write_csv(data_cleaned, "inputs/data/data_cleaned.csv")

