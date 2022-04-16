

inputs_module_ui <- function(id) {
  ns <- NS(id)

  fluidRow(
    box(
      width = 12,
      title = "Inputs",
      h3("Key Drivers"),
      rHandsontableOutput(ns("key_drivers")),
      h3("Balance Sheet Assumptions"),
      rHandsontableOutput(ns("bs")),
      h3("Margin Assumptions"),
      rHandsontableOutput(ns("margin")),
      h3("Insurance Assumptions"),
      rHandsontableOutput(ns("insurance")),
      h3("Ride-hail Assumptions"),
      rHandsontableOutput(ns("ride")),
      h3("Autonomous Assumptions"),
      rHandsontableOutput(ns("autonomous")),
      h3("Valuation Assumptions"),
      rHandsontableOutput(ns("valuation"))
    )
  )
}

inputs_module <- function(input, output, session) {

  output$key_drivers <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Key Drivers") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = c(
        "",
        "Minimum",
        "Downside",
        "Upside",
        "Maximum"
      ),
      colWidths = c(350, rep(100, times = length(out) - 1)),
      rowHeaders = NULL,
      width = "100%"
    ) %>%
      hot_col(
        col = "",
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$bs <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Balance sheet assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      width = "100%",
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$margin <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Margin Assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      width = "100%",
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$insurance <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Insurance assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      width = "100%",
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$ride <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Ride-hail assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      width = "100%",
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$autonomous <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Autonomous Assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      width = "100%",
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })

  output$valuation <- renderRHandsontable({
    out <- inputs %>%
      filter(metric_cat == "Valuation Assumptions") %>%
      select(-metric_cat)

    rhandsontable(
      out,
      stretchH = "all",
      scrollH = "auto",
      width = "100%",
      contextMenu = NULL,
      colHeaders = NULL,
      rowHeaders = NULL,
      colWidths = c(350, rep(100, times = length(out) - 1))
    ) %>%
      hot_col(
        col = 1,
        renderer = JS(format_read_only_cols(1, "Text")),
        readOnly = TRUE
      )

  })
}
