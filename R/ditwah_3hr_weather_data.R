#' Ditwah storm 3 hour weather station data – November 2025, Sri Lanka
#'
#' @description This dataset contains weather station measurements collected during the Ditwah storm in November 2025 in Sri Lanka.
#' It includes rainfall, temperature, humidity, and a summary report from each station.
#' @importFrom tibble tibble
#' @format A data frame with 92 rows and 7 columns:
#' \describe{
#'   \item{Station_ID}{Unique identifier for each weather station}
#'   \item{Station_Name}{Name of the weather station}
#'   \item{Report_Time}{Date and time of the report (YYYY-MM-DD HH:MM format)}
#'   \item{Rainfall_mm}{Measured rainfall in millimeters during the reporting period}
#'   \item{Temperature_C}{Measured temperature in degrees Celsius}
#'   \item{RH_%}{Relative humidity percentage at the reporting time}
#'   \item{report}{Grouping variable to report records}
#' }
#' @source Department Of Meteorology, Sri Lanka (https://meteo.gov.lk/)
"ditwah_3hr_weather_data"
