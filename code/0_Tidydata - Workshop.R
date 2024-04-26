# available at https://github.com/LundeChris/vietnam_report_public

#Loading packages 
library(tidyverse)
library(readxl)

#Loading data for the report
Data_imported <- read_excel("./input/Data - 2022 population living standards survey - Thuc hanh DN.xlsx") |> 
  select(MaTinh_Dieutra, # Province
         MaHuyen_Dieutra, # District
         MaNganhC5_Chinh,
         SoLaodong_CuoiNam, # Employees end of year
         SoLaodong_CuoiNam_Nu, # Female employees end of year
         SoLaodong_CuoiNam_KhongLuong, # Non-paid employees end of year
         SoLaodong_CuoiNam_Dong_BHXH, # Employees with social security end of year
         SR_Loinhuan_TruocThue # Profit before tax
  ) |> 
  rename("Province" = MaTinh_Dieutra,
         "District" = MaHuyen_Dieutra,
         "prim_prod5" = MaNganhC5_Chinh,
         "n_employee" = SoLaodong_CuoiNam,
         "n_female_employee" = SoLaodong_CuoiNam_Nu,
         "n_nonpaid_employee" = SoLaodong_CuoiNam_KhongLuong,
         "n_employee_ss" = SoLaodong_CuoiNam_Dong_BHXH,
         "profit" = SR_Loinhuan_TruocThue) |>
  mutate(n_employee = ifelse(is.na(n_employee), 0, n_employee),
         n_female_employee = ifelse(is.na(n_female_employee), 0, n_female_employee),
         n_nonpaid_employee = ifelse(is.na(n_nonpaid_employee), 0, n_nonpaid_employee),
         n_employee_ss = ifelse(is.na(n_employee_ss), 0, n_employee_ss),
         profit = ifelse(is.na(profit), 0, profit))

#Loading format for district
geo_list <- read_excel("input/Additional categories  _ 09_04_2024..xlsx") |> 
  select(District, District_name) |> 
  unique() #Remove duplicate observations


#Loading format for primary production codes
prim_prod_list <- read_excel("input/Noi dung HTNSP .xlsx",
                             skip = 3) |> 
  select(`Cấp 7`,
         `Cấp 6`,
         `Cấp 5`,
         `Cấp 4`,
         `Cấp 3`,
         `Cấp 2`,
         `Cấp 1`,
         `Tên sản phẩm`) |>
  gather(key = "variable", value = "value",-`Tên sản phẩm`) |> 
  filter(!is.na(value)) |> 
  unique()

# Final adjustments to data
data_to_figure <-  Data_imported |>
  #Including district name
  left_join(geo_list, join_by("District"=="District")) |>
  left_join(prim_prod_list, join_by("prim_prod5"=="value"))
# Add lables if needed


#Save data
saveRDS(data_to_figure, "./tidy_data/data_to_figure_workshop.rds")

