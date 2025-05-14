# convert_state_values.R
## Converts the string levels of bg1, bg2, fg1, fg2 into integers 0 for light/white and 1 for dark/black

convert_state_values <- function(data) {
  data %>% mutate(
    bg1 = case_match(
      bg1,
      "light" ~ 0,
      "dark" ~ 1
    ),
    bg2 = case_match(
      bg2,
      "light" ~ 0,
      "dark" ~ 1
    ),
    fg1 = case_match(
      fg1,
      "white" ~ 0,
      "black" ~ 1
    ),
    fg2 = case_match(
      fg2,
      "white" ~ 0,
      "black" ~ 1
    )
  )
}