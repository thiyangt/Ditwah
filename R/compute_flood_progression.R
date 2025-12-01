#' Computes number of hours in alert, minor and major levels starting from 26 Nov 2025
#'
#' Classify flood levels as alert, minor and major and compute the total number of hours in each state
#'
#' @param data data frame with variables date and time, river water level, alert level,
#' major flood level and minor flood level
#' @param DateTime Variable name corresponds to Date and Time (%Y-%m-%d %H:%M)
#' @param RiverWaterLevel Variable name corresponds to the River Water Level
#' @param alert Alert level numeric value
#' @param major Major flood level numeric value
#' @param minor Minor flood level numeric value
#' @return A list containing a tibble including new variable called state classifying flood level and total number of hours spent in each state
#' @importFrom dplyr mutate
#' @importFrom dplyr case_when
#' @importFrom dplyr lead
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom tibble tibble
#' @export
compute_flood_stats <- function(data, DateTime, RiverWaterLevel, alert, major, minor){


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
list(
  data,
  durations)

}

