#' Search and Expand Tags Based on Indices
#'
#' This function provides a searchable table of tags and names of of V-Dem indices included in `vdemlite`. The table is based on the [Structure of V-Dem Indices, Components and Indicators](https://v-dem.net/documents/41/v-dem_structureofaggregation_v14.pdf) document and includes four columns: the variable tag; the index or indicator descriptor; the level of the index or indicator (high-level index, mid-level index, lower-level index; or indicator); and a column called "Part" that distinguishes between V-Dem Indicators and Indices (part 1) and indices created using V-Dem data (part 2). The default behavior is to return all indices and their descriptions. If a character vector of indices is provided, the function will return any sub-indices and indicators used to construct the selected indices.
#'
#' @param indicator A character vector of indices to search and expand. Useful when looking for sub-indices and indicators used to construct a high-level index. Default is `NULL`.
#' @return An interactive table with names and descriptions of V-Dem indicators and indices included in the `vdemlite` dataset.
#' @import dplyr stringr gt gtExtras
#' @examples
#' # Return the full table of indices
#' searchdem()
#'
#' # Return indices and indicators used to construct polyarchy
#' searchdem("v2x_polyarchy")
#'
#' # Return indicators used to construct women's political empowerment and rule of law indices
#' searchdem(c("v2x_gender", "v2x_rule"))
#' @export
searchdem <- function(indicator = NULL) {

  if (!is.null(indicator)) {
    # Initialize vector of indicators
    expanded_tags <- c()

    # Loop through each index, pull and store relevant tags
    for (index in indicator) {
      if (stringr::str_starts(index, "v2x")) {
        levels <- lookup_tbl |>
          dplyr::filter(tag == index) |>
          dplyr::pull(level)

        if (length(levels) == 0) {
          stop("Invalid index. May be an indicator or not
               included in vdemlite.")
        }

        # Prioritize levels: high_level > lower_level
        if ("high_level" %in% levels) {
          level <- "high_level"
        } else if ("lower_level" %in% levels) {
          level <- "lower_level"
        } else if ("mid_level" %in% levels) {
          stop("Invalid index. Mid-level indices are not directly
               available. Use high- or low-level indices instead.")
        } else {
          stop("Invalid index. May be an indicator or not included
               in vdemlite.")
        }

        # Pull tags based on level
        if (level == "high_level") {
          high_tags <- lookup_tbl |>
            dplyr::filter(hl_category == paste0(index, "_all")) |>
            dplyr::pull(tag)
          expanded_tags <- unique(c(expanded_tags, high_tags))
        } else if (level == "lower_level") {
          low_tags <- lookup_tbl |>
            dplyr::filter(ll_category == paste0(index, "_all")) |>
            dplyr::pull(tag)
          expanded_tags <- unique(c(expanded_tags, low_tags))
        } else if (level == "mid_level") {
          message("This is a mid-level index that is used in the
                  construction of a high-level index.")
        } else {
          stop("Invalid index. May be an indicator or not included
               in vdemlite.")
        }
      }
    }
  }

  # Start with lookup table
  table_df <- lookup_tbl |>
    dplyr::distinct(tag, .keep_all = TRUE)

  # Filter based on selected categories
  if (!is.null(indicator)) {
    table_df <- lookup_tbl |>
      dplyr::filter(tag %in% expanded_tags) |>
      dplyr::distinct(tag, .keep_all = TRUE)
  }

  # Select columns to display
  table_df <- table_df |>
    dplyr::select(tag, name, level, part)

  summary_table <- gt::gt(table_df) |>
    gt::tab_header(
      title = paste("Variable Tags and Descriptions")
    ) |>
    gt::cols_label(
      tag = "Tag",
      name = "Descriptor",
      level = "Level",
      part = "Part"
    ) |>
    gt::opt_interactive(
      use_sorting = TRUE,
      use_filters = TRUE,
      use_compact_mode = TRUE,
      use_page_size_select = TRUE
    )

  return(summary_table)
}
