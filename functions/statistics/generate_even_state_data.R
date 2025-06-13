# generate_even_state_data
## Generates a dataset where the white/black and light/dark ratio's are 1 by removing datapoints

generate_even_state_data <- function(data) {
  data %>% remove_sample_from_trial(
    c(1,2),
    16
  ) %>% remove_sample_from_trial(
    c(7,8),
    45
  )
}