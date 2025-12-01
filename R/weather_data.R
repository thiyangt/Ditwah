#' Daily rainfall data during the Ditwah storm period
#'
#' This dataset contains daily rainfall information downloaded from the
#' Department of Meteorology, Sri Lanka. The data includes station details,
#' reporting times, and recorded rainfall amounts.
#'
#'
#' @format A data frame with the following columns:
#' \describe{
#'   \item{Date_downloaded}{Date on which the data was downloaded (YYYY-MM-DD).}
#'   \item{Reporting_Time}{Time of rainfall reporting (HH:MM).}
#'   \item{Type}{Type of station (e.g., "Rainfall", "Agro", etc.).}
#'   \item{Name}{Name of the meteorological or rainfall station.}
#'   \item{Daily_Rainfall_mm}{Recorded daily rainfall in millimetres.}
#' }
#'@importFrom tibble tibble
#'@source Department of Meteorology, Sri Lanka
#' <https://meteo.gov.lk/>
#' @usage data(weather_report)
#' @keywords datasets rainfall meteorology SriLanka
#'
"weather_report"









