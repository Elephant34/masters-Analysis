# remove_sample_from_trial.R
## Removes a random sample n of rows from the given trials

remove_sample_from_trial <- function(data, trials, n){
  data %>% filter(
    trial_id %in% trials
  ) %>% group_by(
    trial_id
  ) %>% slice_sample(
    n=-n
  ) %>% ungroup(
    
  ) %>% bind_rows(
    data %>% filter(!trial_id %in% trials)
  )
}