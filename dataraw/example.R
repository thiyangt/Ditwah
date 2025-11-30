library(lubridate)

realtime_waterlevel_kelani_ganga <- realtime_waterlevel_kelani_ganga |>
  dplyr::mutate(
    DateTime = ymd_h(paste(Date, Time), tz = "UTC"))
sub <- realtime_waterlevel_kelani_ganga |>
  filter(HydrometricStation =="Deraniyagala")
View(sub)
data(sub)
data=sub
DataTime=DateTime
RiverWaterLevel= RiverWaterLevel







compute_flood_stats(data=sub,
                    DataTime,
                    RiverWaterLevel,
                    alert = 3,
                    major = 4,
                    minor = 5)
