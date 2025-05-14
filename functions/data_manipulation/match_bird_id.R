# match_bird_id.R
## Function to match the cleaned gate data to the bird identification data

match_bird_id <- function(data, bird_id_path) {
  
  # Read in the bird ID file
  bird_ids <- read_csv(bird_id_path) %>% mutate(
    rounded_entrance_epoch_time = sprintf("%.5f",round(entrance_epoch_time, 5))
  )
  
  
  data %>% mutate( # Add a rounding column to avoid issue with csv reading
    rounded_entrance_epoch_time = sprintf("%.5f",round(entrance_epoch_time, 5))
  ) %>% left_join( # join the datasets together
    bird_ids,
    by = join_by("rounded_entrance_epoch_time"),
    relationship = "one-to-one",
  ) %>% select( # Remove surplus columns
    -left_ring,
    -right_ring,
    -`Verify?`,
    -photo_path,
    -entrance_epoch_time.y,
    -datetime.y,
    -rounded_entrance_epoch_time
  ) %>% rename( # Correct column names
    entrance_epoch_time = entrance_epoch_time.x,
    datetime = datetime.x
  )
}