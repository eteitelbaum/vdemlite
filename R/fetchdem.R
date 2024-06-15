#' Fetch and Filter V-Dem Lite Data
#'
#' This function fetches and filters data from the V-Dem Lite dataset based on specified indicators, years, and countries.
#' It can return the data in either wide or long format.
#'
#' @param indicators A character vector of indicator names or categories. If NULL, all indicators are included.
#' @param start_year The starting year for filtering the data. Default is 1970.
#' @param end_year The ending year for filtering the data. Default is 2023.
#' @param countries A character vector of country IDs to filter the data. If NULL, all countries are included.
#' @param wide Logical, whether to return the data in wide format. If FALSE, returns data in long format. Default is TRUE.
#' @return A data frame containing the filtered V-Dem Lite data in the specified format.
#' @import dplyr tidyr
#' @examples
#' fetchdem(indicators = c("v2x_polyarchy", "v2x_freexp_altinf"), start_year = 2000, end_year = 2020, countries = c("USA", "SWE"), wide = TRUE)
#' fetchdem(indicators = "v2x_polyarchy", start_year = 1980, end_year = 2020, countries = NULL, wide = FALSE)
#' @export
fetchdem <- function(indicators = NULL,
                     start_year = 1970,
                     end_year = 2023,
                     countries = NULL,
                     wide = TRUE) {

  # Load lookup table
  lookup_tbl <- lookup_tbl

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
      dplyr::select(c("country_name",
                      "country_text_id",
                      "year",
                      all_of(indicators)))
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
