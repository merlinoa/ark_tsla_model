library(DT)
library(dplyr)
library(highcharter)
library(rhandsontable)
library(shiny)
library(shinydashboard)

inputs <- readRDS("data/inputs.RDS")


#' format_read_conly_cols
#'
#' pass to `rhandsontable::hot_cols()` renderer argument to change the
#' background of a column to light grey
#'
#' @param col_nums
#' @param type character string, can be "Text" or "Numeric"
#'
#' @return string representing javascript function
#'
#' @examples
#'
#' format_read_only_cols(1)
#'
#' format_read_only_cols(1:3)
format_read_only_cols <- function(col_nums, type) { #types "Text" and "Numeric" used

  js_col_nums <- col_nums - 1

  js_col_nums <- paste0("[", paste(js_col_nums, collapse = ", "), "]")

  paste0("
    function(instance, td, row, col, prop, value, cellProperties) {
      Handsontable.renderers.", type, "Renderer.apply(this, arguments);
      tbl = this.HTMLWidgets.widgets[0]
      hcols = ", js_col_nums, "
      if (hcols.includes(col)) {
        td.style.background = '#f0f0f0';
      }
      return td;
    }
  ")
}
