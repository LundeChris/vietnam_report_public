
rm(list= ls())

library(tidyverse)

# List of districts to use for iteration
list_of_districts <- readRDS("./tidy_data/data_to_figure.rds") |> 
  distinct(Province, District_name) |> 
  sample_n(5)

# Counter to show how far we have gotten
counter = 0 

# Loop
for (i in list_of_districts$District_name){
  
  province = list_of_districts |> 
    filter(District_name == i) |> 
    pull(Province)
  
  output_path = str_c("./output/", province, "/")
  
  counter = counter + 1 
  
  # Render template file using current district as a paramter
  rmarkdown::render(input = "./code/1_template_workshop.Rmd",
                    params = list(district=i),
                    knit_root_dir = getwd(),
                    output_dir = output_path,
                    output_file=i, 
                    clean = TRUE,
                    quiet = TRUE)
  
  cat("Finished printing report", counter, "of", nrow(list_of_districts))
  cat("\n")
}
