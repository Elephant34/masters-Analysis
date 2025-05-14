# add_context_bird_id
## Add context matching the bird ID using the finch_contextualisation dataset

add_context_bird_id <- function(data, bird_id_path="data/bird_id_contexualisation.csv") {
  
  # Read trial ID file
  bird_ids = read_csv(bird_id_path, col_types = "f")
  
  data %>% left_join(
    bird_ids,
    by = join_by(bird_id)
  ) %>% select(
    -left_tag,
    -right_tag
  )
}