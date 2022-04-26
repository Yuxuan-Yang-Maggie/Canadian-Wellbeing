# We simulate some tidy data that mimics the cleaned data we used.

#### Preamble ####
# Purpose: Obtain and prepare data on survey responses in the 2016 Canadian
# General Social Survey on Work and Home. 
# Author: Yuxuan Yang
# Email: yuxuanmaggie.yang@mail.utoronto.ca
# Date:26 April 2022
# Prerequisites: - 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)

#### Simulate data ####
set.seed(446)

simulated_data <- 
  tibble(
    sex = c(rep(1, 1155),
            rep(2, 1155)),
    smoke_status = c(rep(1, 770),
                     rep(2, 770),
                     rep(3, 770)),
    drink_status = c(rep(1, 330),
                     rep(2, 330),
                     rep(3, 330),
                     rep(4, 330),
                     rep(5, 330),
                     rep(6, 330),
                     rep(7, 330)),
    stress_level = c(rep(1, 462),
                     rep(2, 462),
                     rep(3, 462),
                     rep(4, 462),
                     rep(5, 462)),
    health_level = c(rep(0, 210),
                     rep(1, 210),
                     rep(2, 210),
                     rep(3, 210),
                     rep(4, 210),
                     rep(5, 210),
                     rep(6, 210),
                     rep(7, 210),
                     rep(8, 210),
                     rep(9, 210),
                     rep(10, 210)),
    living_standard = c(rep(0, 210),
                        rep(1, 210),
                        rep(2, 210),
                        rep(3, 210),
                        rep(4, 210),
                        rep(5, 210),
                        rep(6, 210),
                        rep(7, 210),
                        rep(8, 210),
                        rep(9, 210),
                        rep(10, 210)),
    job_satisfaction = c(rep(1, 462),
                         rep(2, 462),
                         rep(3, 462),
                         rep(4, 462),
                         rep(5, 462)),
    eat_habits = c(rep(1, 462),
                   rep(2, 462),
                   rep(3, 462),
                   rep(4, 462),
                   rep(5, 462)),
    income = c(rep(1, 385),
               rep(2, 385),
               rep(3, 385),
               rep(4, 385),
               rep(5, 385),
               rep(6, 385))
    )



# Note: there are more than 20 variables in the data set that we actually used 
# for our analyses, but many of the variables were not used at all. So we simulated
# a data set that contains only the variables used, including: sex, smoke status, 
# alcohol drinking status, stress level, health level, living standard, job satisfaction,
# eat habits, and income. 

# There are 2 values (males and females) for sex; 3 for smoke status;
# 7 for drink status; 5 for stress level; 11 for health level; 
# 11 for living standard, 5 for job satisfactions, 5 for eat habits,
# and 6 for income. 

# Therefore, we generated 2*3*7*5*11 = 2,310 observations. 