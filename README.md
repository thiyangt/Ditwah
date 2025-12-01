
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ditwah

<!-- badges: start -->

<!-- badges: end -->

The Dithwa storm that hit Sri Lanka on November 28, 2025, led to this
package, which focuses on data, monitoring, and early warning.

## Installation

You can install the development version of Ditwah from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("thiyangt/Ditwah")
```

## Load Data 3 Hour Weather Data

``` r
library(Ditwah)
head(ditwah_3hr_weather_data)
#> # A tibble: 6 × 7
#>   Station_ID Station_Name   Report_Time         Rainfall_mm Temperature_C `RH_%`
#>        <dbl> <chr>          <dttm>                    <dbl>         <dbl>  <dbl>
#> 1      43404 JAFFNA         2025-11-28 08:30:00         32           24      100
#> 2      43413 MANNAR         2025-11-28 08:30:00        103.          24.3     95
#> 3      43415 VAVUNIYA       2025-11-28 08:30:00        358.          23.8     98
#> 4      43418 TRINCOMALEE    2025-11-28 08:30:00        262.          24.6     99
#> 5      43421 ANURADHAPURA   2025-11-28 08:30:00        331           21.4    100
#> 6      43422 MAHA ILLUPPAL… 2025-11-28 08:30:00        273.          22       99
#> # ℹ 1 more variable: report <dbl>
```

## Data Visualisation

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

## Flood Level Data

    #> # A tibble: 154 × 16
    #>    Report_Date Report_Time         River_Basin   Tributory_River Gauging_Station
    #>    <chr>       <dttm>              <chr>         <chr>           <chr>          
    #>  1 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Nagalagam Stre…
    #>  2 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Nagalagam Stre…
    #>  3 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Hanwella       
    #>  4 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Hanwella       
    #>  5 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Glencourse     
    #>  6 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Glencourse     
    #>  7 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Kithulgala     
    #>  8 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Kelani Ganga    Kithulgala     
    #>  9 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Gurugoda Oya    Holombuwa      
    #> 10 28-11-2025  2025-11-28 09:30:00 "Kelani Gang… Gurugoda Oya    Holombuwa      
    #> # ℹ 144 more rows
    #> # ℹ 11 more variables: Unit <chr>, AlertLevel <dbl>, MinorFloodLevel <dbl>,
    #> #   MajorFloodLevel <dbl>, Remarks <chr>, WaterLevelRising_or_Falling <chr>,
    #> #   Water_Level_Time <chr>, Water_Level <dbl>, RFmm <dbl>,
    #> #   RFmm_measured_at <chr>, Water_Level_DateTime <dttm>

## Situation Report

``` r
situation_report_30NOV1600
#> # A tibble: 25 × 8
#>    Districts    Families Persons Deaths Missing Safety_centres
#>    <chr>           <dbl>   <dbl>  <dbl>   <dbl>          <dbl>
#>  1 Puttlama        36098  135922     NA       2             59
#>  2 Badulla          7973   32760     71      53            180
#>  3 Moneragala        968    3346      3       1              5
#>  4 Matale            806    4836     20      10             40
#>  5 Colombo         40740  174255      2       1             97
#>  6 Batticola       16257   47856      2      NA             17
#>  7 Kegalle           557    2095      2       1             14
#>  8 Trincomalee     16604   54107     NA      NA             21
#>  9 Anuradhapura     7429   25800      5      NA             92
#> 10 Mullaitivu       1550    4592      1      NA            102
#> # ℹ 15 more rows
#> # ℹ 2 more variables: Families_safetycentres <dbl>, Persons_safetycentres <dbl>
```

## Load dashboard

``` r
load_dashboard()
```

![](hexsticker/db.png)

## Flood Progression

``` r
library(lubridate)
#> 
#> Attaching package: 'lubridate'
#> The following objects are masked from 'package:base':
#> 
#>     date, intersect, setdiff, union
realtime_waterlevel_kelani_ganga <- realtime_waterlevel_kelani_ganga |>
 dplyr::mutate(
 DateTime = ymd_h(paste(Date, Time), tz = "UTC"))
 sub <- realtime_waterlevel_kelani_ganga |>
 filter(HydrometricStation =="Deraniyagala")
compute_flood_stats(data=sub,
DataTime,
RiverWaterLevel,
alert = 3,
major = 4,
minor = 5)
#> [[1]]
#> # A tibble: 97 × 12
#>    Date                 Time RiverBasin   HydrometricStation Rainfall_mm
#>    <dttm>              <dbl> <chr>        <chr>              <chr>      
#>  1 2025-11-26 00:00:00     8 Kelani Ganga Deraniyagala       0          
#>  2 2025-11-26 00:00:00     9 Kelani Ganga Deraniyagala       0.9        
#>  3 2025-11-26 00:00:00    10 Kelani Ganga Deraniyagala       2          
#>  4 2025-11-26 00:00:00    11 Kelani Ganga Deraniyagala       1.3        
#>  5 2025-11-26 00:00:00    12 Kelani Ganga Deraniyagala       0.5        
#>  6 2025-11-26 00:00:00    13 Kelani Ganga Deraniyagala       NA         
#>  7 2025-11-26 00:00:00    14 Kelani Ganga Deraniyagala       NA         
#>  8 2025-11-26 00:00:00    15 Kelani Ganga Deraniyagala       2.1        
#>  9 2025-11-26 00:00:00    16 Kelani Ganga Deraniyagala       1.3        
#> 10 2025-11-26 00:00:00    17 Kelani Ganga Deraniyagala       1.7        
#> # ℹ 87 more rows
#> # ℹ 7 more variables: RiverWaterLevel <dbl>, RiverWaterLevel_Unit <chr>,
#> #   Alert_level <dbl>, Minor_Flood_Level <dbl>, Major_Flood_level <dbl>,
#> #   DateTime <dttm>, state <chr>
#> 
#> [[2]]
#> # A tibble: 3 × 2
#>   state  hours
#>   <chr>  <dbl>
#> 1 alert      9
#> 2 major     66
#> 3 normal    21
```

This package was developed for educational purposes using weather data
recorded by the [Department of Meteorology, Sri
Lanka](https://meteo.gov.lk/), [Disaster Management
Centre](https://www.dmc.gov.lk/index.php?lang=en) and Hydrology and
Disaster Management Division, Irrigation Department, Sri Lanka. All data
provided in this package have been obtained from publicly available
sources and transformed into a tidy format to support reproducible and
user-friendly analysis.
