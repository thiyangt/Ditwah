#' Compute Flood Progression and Crest Metrics
#'
#' Computes key flood progression measures from real-time river water level data.
#'
#' @param data data frame with variables date and time, river water level, alert level,
#' major flood level and minor flood level
#' @param DateTime Variable name corresponds to Date and Time (%Y-%m-%d %H:%M)
#' @param RiverWaterLevel Variable name corresponds to the River Water Level
#' @param alert Alert level numeric value
#' @param major Major flood level numeric value
#' @param minor Minor flood level numeric value
#' @return A tibble with progression and crest-related metrics
#' @export
compute_flood_stats <- function(data, DataTime, RiverWaterLevel, alert, major, minor){


  # --- Flood state classification ---
  data <- data |>
    dplyr::mutate(
      state = dplyr::case_when(
        RiverWaterLevel >= major ~ "major",
        RiverWaterLevel >= minor ~ "minor",
        RiverWaterLevel >= alert ~ "alert",
        TRUE ~ "normal"
      )
    )

  # --- Duration in each state ---
  durations <- data |>
    dplyr::mutate(
      next_time = dplyr::lead(DateTime),
      dt = as.numeric(difftime(next_time, DateTime, units = "hours"))
    ) |>
    dplyr::group_by(state) |>
    dplyr::summarise(hours = sum(dt, na.rm = TRUE), .groups = "drop")

  ## Crest_level
  ##crest_level <- max(dplyr::pull(data, !!RiverWaterLevel), na.rm = TRUE)

  durations

}
#'@example
#'library(lubridate)
#'realtime_waterlevel_kelani_ganga <- realtime_waterlevel_kelani_ganga |>
#'  dplyr::mutate(
#'    DateTime = ymd_h(paste(Date, Time), tz = "UTC"))
#' sub <- realtime_waterlevel_kelani_ganga |>
#'  filter(HydrometricStation =="Deraniyagala")
#'compute_flood_stats(data=sub,
#'DataTime,
#'RiverWaterLevel,
#'alert = 3,
#'major = 4,
#'minor = 5)
#'
