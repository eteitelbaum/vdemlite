% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetchdem.R
\name{fetchdem}
\alias{fetchdem}
\title{Fetch and Filter V-Dem Lite Data}
\usage{
fetchdem(
  indicators = NULL,
  start_year = 1970,
  end_year = 2023,
  countries = NULL,
  wide = TRUE
)
}
\arguments{
\item{indicators}{A character vector of indicator names or categories. If NULL, all indicators are included.}

\item{start_year}{The starting year for filtering the data. Default is 1970.}

\item{end_year}{The ending year for filtering the data. Default is 2023.}

\item{countries}{A character vector of country IDs to filter the data. If NULL, all countries are included.}

\item{wide}{Logical, whether to return the data in wide format. If FALSE, returns data in long format. Default is TRUE.}
}
\value{
A data frame containing the filtered V-Dem Lite data in the specified format.
}
\description{
This function filters data from a slimmed down version of the V-Dem dataset based on specified indicators, years, and countries. It can return the data in either wide or long format. Users can query specific indices and indicators as well as pre-defined groups of indicators as defined by the V-Dem codebook.
}
\examples{
# Polyarchy score for all countries for 1980-2020
polyarchy <- fetchdem(indicators = "v2x_polyarchy",
                      start_year = 1980, end_year = 2020)

# Polyarchy and clean elections index for USA and Sweden for 2000-2020
my_indicators <- fetchdem(indicators = c("v2x_polyarchy", "v2xel_frefair"),
                        start_year = 2000, end_year = 2020,
                        countries = c("USA", "SWE"))

# Five main high-level indices for all countries and years in long format
big_5 <- fetchdem(indicators = "big_5", wide = FALSE)

# Indicators that comprise the liberal democracy index for India, all years
lib_dem_ind_2010 <- fetchdem(indicators = "v2x_libdem_all",
                            countries = "IND")

# Indicators that comprise the Regimes of the World index for Venezuela, all years
regime_venezuela <- fetchdem(indicators = "v2x_regime_all",
                           countries = "VEN")

# All high-level indices for all countries in 2015
high_level_2015 <- fetchdem(indicators = "high_level",
                        start_year = 2015, end_year = 2015)

# All mid-level indices for all countries in 2015
mid_level_2015 <- fetchdem(indicators = "mid_level",
                         start_year = 2015, end_year = 2015)

# All lower-level indices for all countries in 2015
lower_level_2015 <- fetchdem(indicators = "lower_level",
                        start_year = 2015, end_year = 2015)

# Polyarchy and background factors, all countries and years
polyarchy_analysis <- fetchdem(indicators = c("v2x_polyarchy", "background"))

}
