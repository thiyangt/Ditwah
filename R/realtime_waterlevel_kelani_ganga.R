#' Real-time water level data for Kelani river basin
#'
#' This dataset contains real-time rainfall and river water-level observations
#' from hydrometric stations in the Kelani river basin. The data were
#' obtained from dashboard by Hydrology and Disaster Management Division, Irrigation Department, Sri Lanka.
#'
#' @format A data frame with the following 10 variables:
#' \describe{
#'   \item{Date}{Date of the observation}
#'   \item{Time}{Hour of the day}
#'   \item{RiverBasin}{Name of the river basin.}
#'   \item{HydrometricStation}{Name of the hydrometric (gauging) station.}
#'   \item{Rainfall_mm}{Rainfall recorded at the station (in millimetres).}
#'   \item{RiverWaterLevel}{Observed river water level.}
#'   \item{RiverWaterLevel_Unit}{Unit of measurement for the water level (e.g.,m, ft).}
#'   \item{Alert_level}{Official alert level corresponding to the observed water level.}
#'   \item{Minor_Flood_Level}{Threshold level that triggers a minor flood alert.}
#'   \item{Major_Flood_level}{Threshold level that triggers a major flood alert.}
#' }
#' @importFrom tibble tibble
#' @source Hydrology and Disaster Management Division, Irrigation Department, Sri Lanka (accessed: 30 Nov 2025)
#'
#' @usage realtime_waterlevel_kelani_ganga
"realtime_waterlevel_kelani_ganga"
