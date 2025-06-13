# generate_state_bias_tibble.R
## Generates a tibble containing the white/light to black/dark ratio of the data

generate_state_bias_tibble <- function(data, pretty = FALSE) {
  table <- data %>% pivot_longer(
    c(bg1, bg2, fg1, fg2),
    names_to = "condition",
    values_to = "values"
  ) %>% count(
    condition,
    values
  ) %>% pivot_wider(
    names_from = values,
    values_from = n,
    values_fill = 0
  ) %>% mutate(
    ratio = case_when(
      str_starts(condition, "bg") ~ light/dark,
      str_starts(condition, "fg") ~ white/black
    )
  ) %>% select(
    condition,
    ratio
  ) %>% pivot_wider(
    names_from = condition,
    values_from = ratio
  )
  if(pretty) {
    table <- table %>% mutate(
      condition = case_match(
        condition,
        "bg1" ~ "Left Background",
        "bg2" ~ "Right Background",
        "fg1" ~ "Left Foreground",
        "fg2" ~ "Right Foreground"
      )
    )
  }
  
  table
}