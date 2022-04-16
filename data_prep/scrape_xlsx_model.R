library(openxlsx)
library(dplyr)
library(tidyr)

# read in the inputs and save them for use in the Shiny app
inputs <- read.xlsx(
  xlsxFile = "docs/Tesla 2026 Valuation Extract for Github.xlsx",
  sheet = "Tesla Valuation Inputs",
  startRow = 10,
  cols = 1:5
)

# rename columns
names(inputs) <- c(
  "metric",
  tolower(names(inputs)[2:5])
)



# convert the row headers to a "metric_cat" column
inputs$metric_cat <- NA_character_
hold_cat <- NULL
for (i in seq_len(nrow(inputs))) {
  hold_row <- inputs[i, ]
  if (is.na(hold_row$minimum)) {
    hold_cat <- hold_row$metric
  } else {
    inputs$metric_cat[i] <- hold_cat
  }
}

inputs <- inputs %>%
  filter(!is.na(metric_cat))


saveRDS(
  inputs,
  file = "shiny_app/data/inputs.RDS"
)
