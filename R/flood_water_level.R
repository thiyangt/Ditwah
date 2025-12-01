#' Ditwah storm flood monitoring data
#'
#' @description
#' This dataset contains hydrological and rainfall measurements recorded at
#' gauging stations during the Ditwah storm in November 2025, Sri Lanka.
#' It includes water levels, flood alert thresholds, rainfall measurements,
#' and additional operational remarks used for monitoring river conditions.
#'@importFrom tibble tibble
#' @format A data frame with observations on the following 15 variables:
#' \describe{
#'   \item{Report_Date}{Date on which the hydrological report was recorded (YYYY-MM-DD).}
#'   \item{Report_Time}{Time at which the report was generated.}
#'   \item{River_Basin}{Name of the main river basin associated with the observation site.}
#'   \item{Tributory_River}{Name of the tributary river connected to the gauging station.}
#'   \item{Gauging_Station}{Name or identifier of the station where hydrological measurements were taken.}
#'   \item{Unit}{Unit of measurement used for reporting water level (e.g., meters).}
#'   \item{AlertLevel}{Water level threshold at which an alert is declared.}
#'   \item{MinorFloodLevel}{Water level threshold indicating the onset of minor flooding.}
#'   \item{MajorFloodLevel}{Water level threshold indicating the onset of major flooding.}
#'   \item{Remarks}{Additional notes, operational comments, or contextual information related to river or weather conditions.}
#'   \item{WaterLevelRising_or_Falling}{Indicator describing whether the current water level is rising, falling, or stable.}
#'   \item{Water_Level_Time}{Specific time at which the corresponding water level measurement was taken.}
#'   \item{Water_Level}{Recorded water level at the specified measurement time.}
#'   \item{RFmm}{Rainfall amount (in millimetres) measured during the specified recording period.}
#'   \item{RFmm_measured_at}{Time at which the rainfall measurement (RFmm) was taken.}
#'   \item{Water_Level_DateTime}{Recorded water level at the specified measurement time in Date and Time format}
#' }
#'
#' @source Disaster Management Center, Sri Lanka (Based on River Water Leve and Flood Warning reports at https://www.dmc.gov.lk/index.php?option=com_dmcreports&view=reports&Itemid=277&report_type_id=6&lang=en)
#'
"flood_water_level"
