# factorise_data.R
## Converts any defined columns to factors

factorise_data <- function(data) {
  factor_column_list = c(
    "trial_id",
    "exit_gate_id",
    "bird_id",
    "bg1",
    "bg2",
    "fg1",
    "fg2",
    "contrast_bg1_bg2",
    "contrast_bg1_fg1",
    "contrast_fg1_fg2",
    "contrast_fg2_bg2",
    "phenotype",
    "sex"
  )
  
  # data %>% mutate_at(
  #   factor_column_list,
  #   as.factor
  # )
  
  data %>% mutate(
    across(
      any_of(factor_column_list), as.factor
    )
  )
}