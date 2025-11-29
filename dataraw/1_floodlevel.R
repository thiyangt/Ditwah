## set library
library(tidyverse)
library(here)
library(readxl)
library(lubridate)

## Data
X9_30AM_28_11_2025flood <- read_csv("dataraw/csvflood/9.30AM_28_11_2025flood.csv")
View(X9_30AM_28_11_2025flood)
colnames(X9_30AM_28_11_2025flood)

X9_30AM_28_11_2025flood <- X9_30AM_28_11_2025flood |>
  pivot_longer( cols = WaterLevelat8AM: WaterLevelat9AM,
                names_to = "Water_Level_Time",
                values_to = "Water Level")
View(X9_30AM_28_11_2025flood)


X9_30AM_28_11_2025flood <- X9_30AM_28_11_2025flood |>
  rename(RFmm = "24 Hr RF\nin mm at\n8:30AM")
dim(X9_30AM_28_11_2025flood)

X9_30AM_28_11_2025flood$RFmm_measured_at <- rep("24 Hr RF in mm at 8:30AM", 78)

View(X9_30AM_28_11_2025flood)
colnames(X9_30AM_28_11_2025flood)
X9_30AM_28_11_2025flood <- X9_30AM_28_11_2025flood |>
  select("Report_Date" ,
         "Report_Time" ,
         "River Basin" ,
         "Tributory_River" ,
         "Gauging Station",
         "Unit" ,
         "Alert\rLevel"  ,
         "Minor\rFlood\rLevel" ,
         "Major\rFlood\rLevel",
         "Remarks"  ,
         "WaterLevelRising_or_Falling",
         "Water_Level_Time" ,
         "Water Level" ,
         "RFmm" ,
         "RFmm_measured_at")
X9_30AM_28_11_2025flood <- X9_30AM_28_11_2025flood |>
  rename(
    "Water_Level" = "Water Level",
    "River_Basin" = "River Basin",
    "Gauging_Station" = "Gauging Station",
    "AlertLevel" = "Alert\rLevel"  ,
    "MinorFloodLevel"   = "Minor\rFlood\rLevel" ,
    "MajorFloodLevel" = "Major\rFlood\rLevel")
X9_30AM_28_11_2025flood$Report_Time <- rep(
  as.POSIXct("2025-11-28 09:30", format = "%Y-%m-%d %H:%M"),
  nrow(X9_30AM_28_11_2025flood)
)
###########################################################
X12_30AM_29_11_2025flood <- read_csv("dataraw/csvflood/12.30AM_29_11_2025flood.csv")
View(X12_30AM_29_11_2025flood)
colnames(X12_30AM_29_11_2025flood)

X12_30AM_29_11_2025flood <- X12_30AM_29_11_2025flood |>
  pivot_longer( cols = WaterLevelat11PM: WaterLevelat12midnight,
                names_to = "Water_Level_Time",
                values_to = "Water Level")
View(X12_30AM_29_11_2025flood)


X12_30AM_29_11_2025flood <- X12_30AM_29_11_2025flood |>
  rename(RFmm = "15 Hr RF\rin mm at\r12.00\rmidnight")
dim(X12_30AM_29_11_2025flood)
times <- dim(X12_30AM_29_11_2025flood)[1]
X12_30AM_29_11_2025flood$RFmm_measured_at <- rep("15 Hr RF in mm at 00:00",
                                                 times)

View(X12_30AM_29_11_2025flood)
colnames(X12_30AM_29_11_2025flood)
X12_30AM_29_11_2025flood <- X12_30AM_29_11_2025flood |>
  select("Report_Date" ,
         "Report_Time" ,
         "River Basin" ,
         "Tributory_River" ,
         "Gauging Station",
         "Unit" ,
         "Alert\rLevel"  ,
         "Minor\rFlood\rLevel" ,
         "Major\rFlood\rLevel",
         "Remarks"  ,
         "WaterLevelRising_or_Falling",
         "Water_Level_Time" ,
         "Water Level" ,
         "RFmm" ,
         "RFmm_measured_at")
X12_30AM_29_11_2025flood <- X12_30AM_29_11_2025flood |>
  rename(
    "Water_Level" = "Water Level",
    "River_Basin" = "River Basin",
    "Gauging_Station" = "Gauging Station",
    "AlertLevel" = "Alert\rLevel"  ,
    "MinorFloodLevel"   = "Minor\rFlood\rLevel" ,
    "MajorFloodLevel" = "Major\rFlood\rLevel")

X12_30AM_29_11_2025flood$Report_Time <- rep(
  as.POSIXct("2025-11-29 00:30", format = "%Y-%m-%d %H:%M"),
  nrow(X12_30AM_29_11_2025flood)
)

flood_water_level <- dplyr::bind_rows(X9_30AM_28_11_2025flood,
                                      X12_30AM_29_11_2025flood)
colnames(flood_water_level)
View(flood_water_level)
unique(flood_water_level$Water_Level_Time)
flood_water_level <- flood_water_level |>
  mutate(
    Water_Level_DateTime = case_when(
      Water_Level_Time == "WaterLevelat8AM" ~ dmy_hm("28-11-2024 08:00"),
      Water_Level_Time == "WaterLevelat9AM" ~ dmy_hm("28-11-2024 09:00"),
      Water_Level_Time == "WaterLevelat11PM" ~ dmy_hm("28-11-2024 23:00"),
      Water_Level_Time == "WaterLevelat12midnight" ~ dmy_hm("28-11-2024 00:00")
    )
  )
usethis::use_data(flood_water_level, overwrite = TRUE)

