# Packages required
library(rvest)
library(stringr)
library(tidyverse)
library(magrittr)

# Dataset comes from this web page (http://www.nationsonline.org/oneworld/country_code_list.htm)
ccountry.page <- read_html("http://www.nationsonline.org/oneworld/country_code_list.htm")
tab <- ccountry.page %>% html_table(header = TRUE)
country.code <- tab %>% extract2(3)
country.code <- country.code[,2:4]
names(country.code) <- c("Country_name", "code_2digit","code_3digit")
country.code <- country.code[-1,]

write.csv(country.code, "country_code.csv")
