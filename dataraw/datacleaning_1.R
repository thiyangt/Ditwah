## set library
library(tidyverse)
library(here)
library(readxl)
library(lubridate)

## set the location
## 8.30 28-11-2025
Book1 <- read_excel("dataraw/Book1.xlsx")
View(Book1)
colnames(Book1)
Book1$Report_Time <- as.POSIXct(Book1$Report_Time, format = "%Y-%m-%d %H%M")
Book1
ditwah_3hr_weather_data <- Book1
dim(Book1)
## 11.30 28-11-2025
library(readxl)
Book2_11_30_28_11 <- read_excel("dataraw/Book2_11.30_28_11.xlsx")
View(Book2_11_30_28_11)
colnames(Book2_11_30_28_11) <- colnames(Book1)
Book2_11_30_28_11$Report_Time <- as.POSIXct(Book2_11_30_28_11$Report_Time, format = "%Y-%m-%d %H%M")
colnames(Book2_11_30_28_11)
Book2_11_30_28_11$Rainfall_mm <- as.numeric(Book2_11_30_28_11$Rainfall_mm)
dim(Book2_11_30_28_11)

## 2.30 28-11-2025
library(readxl)
Book3_2.30PM_28_11_2025 <- read_excel("dataraw/Book3_2.30PM_28_11_2025.xlsx")
View(Book3_2.30PM_28_11_2025)
colnames(Book3_2.30PM_28_11_2025) <- colnames(Book1)
Book3_2.30PM_28_11_2025$Report_Time <- as.POSIXct(Book3_2.30PM_28_11_2025$Report_Time, format = "%Y-%m-%d %H%M")
colnames(Book3_2.30PM_28_11_2025)
Book3_2.30PM_28_11_2025$Rainfall_mm <- as.numeric(Book3_2.30PM_28_11_2025$Rainfall_mm)
dim(Book3_2.30PM_28_11_2025)

## Binding
ditwah_3hr_weather_data <- bind_rows(ditwah_3hr_weather_data,
                                     Book2_11_30_28_11)
ditwah_3hr_weather_data <- bind_rows(ditwah_3hr_weather_data,
                                     Book3_2.30PM_28_11_2025)

View(ditwah_3hr_weather_data)

ditwah_3hr_weather_data$report <- c(rep(1, 24), rep(2, 24), rep(3, 24))
View(ditwah_3hr_weather_data)
#usethis::use_data(ditwah_3hr_weather_data)


## 5.30 28 Nov 2025
library(readxl)
Book4_5.30PM_28_11_2025 <- read_excel("dataraw/Book4_5.30PM_28_11_2025.xlsx")
dim(Book4_5.30PM_28_11_2025)
View(Book4_5.30PM_28_11_2025)
colnames(Book4_5.30PM_28_11_2025) <- colnames(Book1)
Book4_5.30PM_28_11_2025$Report_Time <- as.POSIXct(Book4_5.30PM_28_11_2025$Report_Time,
                                                  format = "%Y-%m-%d %H%M")
colnames(Book4_5.30PM_28_11_2025)
Book4_5.30PM_28_11_2025$Rainfall_mm <- as.numeric(Book4_5.30PM_28_11_2025$Rainfall_mm)
dim(Book4_5.30PM_28_11_2025)
Book4_5.30PM_28_11_2025$report <- rep(4, 20)
ditwah_3hr_weather_data <- bind_rows(ditwah_3hr_weather_data,
                                     Book4_5.30PM_28_11_2025)
usethis::use_data(ditwah_3hr_weather_data)
