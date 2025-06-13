# generate_count_data.R
## Converts the dataset into count data per trial

generate_count_data <- function(data) {
  data %>% count(
    trial_id,
    exit_gate_id
  ) %>% pivot_wider(
    names_from = exit_gate_id,
    values_from = n
  ) %>% mutate(
    total = left + right,
    normalised_left = left/total,
    normalised_right = right/total,
    normalised_total = total/total
  ) %>% add_context_trial_id(
  ) %>% convert_state_values(
  ) %>% factorise_data()
}