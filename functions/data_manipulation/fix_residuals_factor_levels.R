# fix_residuals_factor_levels.R
## Fix the factor levels of the residuals data so it plots correctly

fix_residuals_factor_levels <- function(data) {
  bird_levels <- unique(data$bird_id)
  
  numeric_ids <- bird_levels[
    !is.na(suppressWarnings(as.numeric(bird_levels)))
  ]
  numeric_ids <- numeric_ids[
    order(as.numeric(numeric_ids))
  ]
  
  non_numeric_ids <- setdiff(
    bird_levels,
    numeric_ids
  ) %>% sort(
  )
  
  new_levels <- c(numeric_ids, non_numeric_ids)
  
  data %>% mutate(
    bird_id = factor(
      bird_id,
      levels = new_levels
    )
  )
}