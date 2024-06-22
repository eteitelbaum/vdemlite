#' Summarize V-Dem Data by Country
#'
#' This function summarizes a specified V-Dem indicator by country for a given time period.
#'
#' @param indicator A character string specifying the V-Dem indicator to summarize.
#' @param start_year An integer specifying the start year for the summary (default is 1970).
#' @param end_year An integer specifying the end year for the summary (default is 2023).
#' @param countries An optional character vector specifying the countries to include (default is NULL, which includes all countries).
#' @param visualization An optional character string specifying the type of visualization to include in the summary table (default is NULL, which includes no visualization). Options include "sparkline", "density" for density plots, or "histogram". Note that it is not recommended to set the visualization parameter if the number of selected countries is large, as it may take a long time to render the table.
#' @return A table summarizing the specified indicator by country.
#' @examples
#' # Summarize the liberal democracy index for all countries and years
#' summarize_dem(indicator = "v2x_libdem")
#'
#' # Summarize the polyarchy index for all countries for the years 2000-2020
#' summarize_dem(indicator = "v2x_polyarchy", start_year = 2000, end_year = 2020)
#'
#' # Summarize the civil liberties index for the BRICS with sparklines
#' countries = c("BRA", "RUS", "IND", "CHN", "ZAF")
#' summarize_dem(indicator = "v2x_civlib",
#'               countries = countries,
#'               visualization = "sparkline")
#'
#' @import dplyr gt gtExtras
#' @importFrom stats median sd
#' @importFrom rlang sym !!
#' @export
summarize_dem <- function(indicator = NULL,
                          start_year = 1970,
                          end_year = 2023,
                          countries = NULL,
                          visualization = NULL) {

  # Check if indicator is provided
  if (is.null(indicator)) {
    stop("Indicator cannot be NULL. Please provide one indicator.")
  }

  # Check if exactly one indicator is provided
  if (length(indicator) != 1) {
    stop("Please provide exactly one indicator.")
  }

  # Check if the provided indicator is in the lookup table
  valid_indicators <- lookup_tbl$tag
  if (!(indicator %in% valid_indicators)) {
    stop("The provided indicator is not valid.")
  }

  # Filter the dataset by the specified years
  filtered_data <- vdemlite |>
    dplyr::filter(year >= start_year & year <= end_year)

  # Filter by countries if provided
  if (!is.null(countries)) {
    filtered_data <- filtered_data |>
      dplyr::filter(country_text_id %in% countries)
  }

  # Select the specified indicator along with year and country
  filtered_data <- filtered_data |>
    dplyr::select(country_name,
                  country_text_id,
                  year,
                  !!rlang::sym(indicator))

  # Calculate the mean indicator value for each year across all countries
  yearly_means <- filtered_data |>
    dplyr::group_by(year) |>
    dplyr::summarize(mean_value = mean(!!rlang::sym(indicator), na.rm = TRUE)) |>
    dplyr::pull(mean_value)

  # Calculate summary statistics for all countries combined
  overall_summary <- filtered_data |>
    dplyr::summarize(
      country_name = "All Selected Countries",
      country_text_id = "",
      unique = dplyr::n_distinct(!!rlang::sym(indicator), na.rm = TRUE),
      missing_pct = mean(is.na(!!rlang::sym(indicator))) * 100,
      mean = mean(!!rlang::sym(indicator), na.rm = TRUE),
      sd = sd(!!rlang::sym(indicator), na.rm = TRUE),
      min = min(!!rlang::sym(indicator), na.rm = TRUE),
      median = median(!!rlang::sym(indicator), na.rm = TRUE),
      max = max(!!rlang::sym(indicator), na.rm = TRUE),
      indicator_data = list(yearly_means)
    )

  # Group by country and summarize the data
  summary_by_country <- filtered_data |>
    dplyr::group_by(country_name, country_text_id) |>
    dplyr::summarize(
      unique = dplyr::n_distinct(!!rlang::sym(indicator), na.rm = TRUE),
      missing_pct = mean(is.na(!!rlang::sym(indicator))) * 100,
      mean = mean(!!rlang::sym(indicator), na.rm = TRUE),
      sd = sd(!!rlang::sym(indicator), na.rm = TRUE),
      min = min(!!rlang::sym(indicator), na.rm = TRUE),
      median = median(!!rlang::sym(indicator), na.rm = TRUE),
      max = max(!!rlang::sym(indicator), na.rm = TRUE),
      indicator_data = list(!!rlang::sym(indicator))
    ) |>
    dplyr::ungroup()

  # Combine overall summary with country-specific summaries
  combined_summary <- bind_rows(overall_summary, summary_by_country)

  summary_table <- gt::gt(combined_summary) |>
    gt::tab_header(
      title = paste("Summary of", indicator, "by Country"),
      subtitle = paste("Years:", start_year, "-", end_year)
    ) |>
    gt::fmt_number(decimals = 2) |>
    gt::fmt_integer(unique) |>
    gt::cols_label(
      country_name = "Country",
      country_text_id = "Country Code",
      unique = "Unique",
      missing_pct = "Missing (%)",
      mean = "Mean",
      sd = "Std. Dev.",
      min = "Min",
      median = "Median",
      max = "Max"
    ) |>
    gt::opt_interactive(
      use_search = TRUE,
      use_compact_mode = TRUE,
      use_page_size_select = TRUE
      )

  if (is.null(visualization)) {
    return(summary_table |> cols_hide("indicator_data"))
  } else if (visualization == "sparkline") {
    return(summary_table |>
             cols_label(indicator_data = "Sparkline") |>
             gtExtras::gt_plt_sparkline(indicator_data))
  } else if (visualization == "density") {
    return(summary_table |>
             cols_label(indicator_data = "Density Plot") |>
             gtExtras::gt_plt_dist(indicator_data, type = "density"))
  } else if (visualization == "histogram") {
    return(summary_table |>
             cols_label(indicator_data = "Histogram") |>
             gtExtras::gt_plt_dist(indicator_data, type = "histogram"))
    return(summary_table)
  } else {
    stop("Invalid visualization type. Please choose 'sparkline', 'density', or 'histogram'.")
  }
}
