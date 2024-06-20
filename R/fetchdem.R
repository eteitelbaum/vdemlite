#' Fetch and Filter V-Dem Lite Data
#'
#' This function filters data from a slimmed down version of the V-Dem dataset based on specified indicators, years, and countries. It can return the data in either wide or long format. Users can query specific indices and indicators as well as pre-defined groups of indicators as defined by the V-Dem codebook.
#'
#' @param indicators A character vector of indicator names or categories. If NULL, all indicators are included.
#' @param start_year The starting year for filtering the data. Default is 1970.
#' @param end_year The ending year for filtering the data. Default is 2023.
#' @param countries A character vector of country IDs to filter the data. If NULL, all countries are included.
#' @param wide Logical, whether to return the data in wide format. If FALSE, returns data in long format. Default is TRUE.
#' @return A data frame containing the filtered V-Dem Lite data in the specified format.
#' @import dplyr tidyr
#' @examples
#' # Polyarchy score for all countries for 1980-2020
#' polyarchy <- fetch_dem(indicators = "v2x_polyarchy",
#'                       start_year = 1980, end_year = 2020)
#'
#' # Polyarchy and clean elections index for USA and Sweden for 2000-2020
#' my_indicators <- fetch_dem(indicators = c("v2x_polyarchy", "v2xel_frefair"),
#'                         start_year = 2000, end_year = 2020,
#'                         countries = c("USA", "SWE"))
#'
#' # Five main high-level indices for all countries and years in long format
#' big_5 <- fetch_dem(indicators = "big_5", wide = FALSE)
#'
#' # Indicators that comprise the liberal democracy index for India, all years
#' lib_dem_ind_2010 <- fetch_dem(indicators = "v2x_libdem_all",
#'                             countries = "IND")
#'
#' # Indicators that comprise the Regimes of the World index for Venezuela, all years
#' regime_venezuela <- fetch_dem(indicators = "v2x_regime_all",
#'                            countries = "VEN")
#'
#' # All high-level indices for all countries in 2015
#' high_level_2015 <- fetch_dem(indicators = "high_level",
#'                         start_year = 2015, end_year = 2015)
#'
#' # All mid-level indices for all countries in 2015
#' mid_level_2015 <- fetch_dem(indicators = "mid_level",
#'                          start_year = 2015, end_year = 2015)
#'
#' # All lower-level indices for all countries in 2015
#' low_level_2015 <- fetch_dem(indicators = "lower_level",
#'                         start_year = 2015, end_year = 2015)
#'
#' # Polyarchy and background factors, all countries and years
#' polyarchy_analysis <- fetch_dem(indicators = c("v2x_polyarchy", "background"))
#'
#' @export
fetch_dem <- function(indicators = NULL,
                     start_year = 1970,
                     end_year = 2023,
                     countries = NULL,
                     wide = TRUE) {

  if (!is.null(indicators)) {
    # Initialize expanded indicators
    expanded_indicators <- c()

    # Loop over each indicator to check if it is a group variable
    for (indicator in indicators) {
      if (indicator %in% lookup_tbl$ll_category) {
        ll_tags <- lookup_tbl |>
          dplyr::filter(ll_category == indicator) |>
          dplyr::pull(tag)
        expanded_indicators <- unique(c(expanded_indicators, ll_tags))
      } else if (indicator %in% lookup_tbl$hl_category) {
        hl_tags <- lookup_tbl |>
          dplyr::filter(hl_category == indicator) |>
          dplyr::pull(tag)
        expanded_indicators <- unique(c(expanded_indicators, hl_tags))
      } else if (indicator %in% lookup_tbl$level) {
        level_tags <- lookup_tbl |>
          dplyr::filter(level == indicator) |>
          dplyr::pull(tag)
        expanded_indicators <- unique(c(expanded_indicators, level_tags))
      } else if (indicator %in% lookup_tbl$big_5) {
        big_5_tags <- lookup_tbl |>
          dplyr::filter(big_5 == indicator) |>
          dplyr::pull(tag)
        expanded_indicators <- unique(c(expanded_indicators, big_5_tags))
      } else if (indicator %in% lookup_tbl$addl_category) {
        addl_tags <- lookup_tbl |>
          dplyr::filter(addl_category == indicator) |>
          dplyr::pull(tag)
        expanded_indicators <- unique(c(expanded_indicators, addl_tags))
      } else {
        # If the indicator is not a group variable, add it directly
        expanded_indicators <- unique(c(expanded_indicators, indicator))
      }
    }

    # Remove duplicates from the final indicators list
    indicators <- unique(expanded_indicators)
  }

  # Start with the dataset
  filtered_data <- vdemlite |>
    dplyr::filter(year >= start_year & year <= end_year)

  # Filter by countries if provided
  if (!is.null(countries)) {
    filtered_data <- filtered_data |>
      dplyr::filter(country_text_id %in% countries)
  }

  # Select indicators if provided
  if (!is.null(indicators)) {
    filtered_data <- filtered_data |>
      dplyr::select(country_name,
                    country_text_id,
                    year,
                    # some indicators from codebook not available in vdem,
                    # so we use `any_of` to avoid errors
                    any_of(indicators))
  }

  # Reshape data to wide or long format based on the user's choice
  if (wide) {
    return(filtered_data)
  } else {
    long_data <- filtered_data |>
      tidyr::pivot_longer(cols = -c(country_name, country_text_id, year),
                          names_to = "indicator",
                          values_to = "value")
    return(long_data)
  }
}
