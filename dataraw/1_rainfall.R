## set library
library(tidyverse)
library(here)
library(readxl)
library(lubridate)

## 28 Nov 2025

weather_report <- read_excel("dataraw/weather_report.xlsx")
View(weather_report)
dim(weather_report)
weather_report$Reporting_Time <- rep("for the 24 hour period ending at 0830SLTS on 28-11-2025",
                                     60)
weather_report$Date_downloaded <- rep("2025-11-28", 60)
colnames(weather_report)
weather_report <- weather_report |>
  select("Date_downloaded",
         "Reporting_Time",
         "Type",
         "Name",
         "Daily_Rainfall_mm")


## 29 Nov 2025
weather_report_29112025 <- read_excel("dataraw/weather_report_29112025.xlsx")
View(weather_report_29112025)
dim(weather_report_29112025)
weather_report_29112025$Reporting_Time <- rep("for the 24 hour period ending at 0830SLTS on 29-11-2025",
                                     60)
weather_report_29112025$Date_downloaded <- rep("2025-11-29", 60)
colnames(weather_report_29112025)
weather_report_29112025 <- weather_report_29112025 |>
  select("Date_downloaded",
         "Reporting_Time",
         "Type",
         "Name",
         "Daily_Rainfall_mm")

weather_report <- bind_rows(weather_report,
                            weather_report_29112025)

usethis::use_data(weather_report)
