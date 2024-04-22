#Loading packages 
library(tidyverse)
library(readxl)

#Loading data for the report
input <- read_excel("./input/Data - 2022 population living standards survey - Thuc hanh DN.xlsx") |> 
  select("Write all relevant variables here"
         ) 

# Final adjustments to data
data_to_figure <-  input |>
  #Adjustning variables that have missing values
  mutate(
    New variable name   = ifelse(is.na(variable name), 0, variable name)) |>
  #Adjusting other variables
  mutate(new variable name = case_when(variable == value ~ true statment, 
                                       TRUE ~ False statment  ))
# Add lables if needed


#Save data
saveRDS(data_to_figure, "./tidy_data/data_to_figure.rds")


