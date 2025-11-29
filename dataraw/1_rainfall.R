## set library
library(tidyverse)
library(here)
library(readxl)
library(lubridate)

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
usethis::use_data(weather_report)
