## set library
library(tidyverse)
library(here)
library(readxl)
library(lubridate)

## Data
realtime_waterlevel_kelani_ganga <- read_excel("dataraw/gis/RealTimeKelaniGanga.xlsx")
View(realtime_waterlevel_kelani_ganga)
usethis::use_data(realtime_waterlevel_kelani_ganga, overwrite = TRUE)
colnames(realtime_waterlevel_kelani_ganga)
