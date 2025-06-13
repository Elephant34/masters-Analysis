# validate_direction.R
## Removes backwards flights from the dataset

validate_direction <- function(data) {
  # Keep only flights which start at entrance and end at an exit
  
  data %>% filter(
    first_gate_id == "entrance",
    second_gate_id %in% c("left","right")
  ) %>% select(
    -first_gate_id
  ) %>% relocate(
    entrance_epoch_time = first_epoch_time,
    exit_epoch_time = second_epoch_time,
    trial_id,
    exit_gate_id = second_gate_id
  )
}