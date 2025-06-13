# generate_even_trial_data.R
## Randomly removes trials until they are the same size

generate_even_trial_data <- function(data) {
  min_count <- data %>% count(trial_id, sort=TRUE) %>% pull(n) %>% last()
  
  data %>% group_by(
    trial_id
  ) %>% slice_sample(
    n = min_count
  ) %>% ungroup(
  )
}