#' Disaster impact summary by district on 2025.11.30 at 16.00 p.m
#'
#' This dataset provides a district-level summary of the impacts of a disaster
#' event in Sri Lanka. It includes the number of affected families, persons,
#' deaths, missing individuals, and details of safety centres established for
#' relief and shelter. Situation Report on 2025.11.30 at 16.00 p.m
#'
#' @format A data frame with one row per district and the following variables:
#' \describe{
#'   \item{Districts}{Character. Name of the administrative district.}
#'   \item{Families}{Integer. Number of families affected in the district.}
#'   \item{Persons}{Integer. Total number of persons affected.}
#'   \item{Deaths}{Integer. Number of confirmed deaths reported.}
#'   \item{Missing}{Integer. Number of individuals reported missing.}
#'   \item{Safety_centres}{Integer. Number of active safety centres operating in the district.}
#'   \item{Families_safetycentres}{Integer. Number of families currently residing in safety centres.}
#'   \item{Persons_safetycentres}{Integer. Number of individuals currently residing in safety centres.}
#' }
#' @importFrom tibble tibble
#' @source Disaster Management Centre, Sri Lanka
#'
#' @description
#' This dataset is part of the package to support real-time monitoring,
#' analysis, and visualisation of disaster impacts. The data have been cleaned
#' and transformed into a tidy format for ease of use in statistical and
#' graphical applications.
#'
#'
#' @examples
#' # Load the data
#' data(situation_report_30NOV1600)
#'
#' # View the first few rows
#' head(situation_report_30NOV1600)
#'
"situation_report_30NOV1600"
