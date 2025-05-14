# add_context_trial_id.R
## Adds context columns to any dataset with a trial_id column using the contextualisation file

add_context_trial_id <- function(data, trial_id_path="data/trial_id_contexualisation.csv") {
  
  # Read trial ID file
  trial_ids = read_csv(trial_id_path, col_types = "f")
  
  data %>% left_join(
    trial_ids,
    by = join_by(trial_id)
  )
}