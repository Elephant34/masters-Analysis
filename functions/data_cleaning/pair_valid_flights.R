# pair_valid_flights.R
## Matches validated rows into a single data entry per valid flight
## Does not discriminate flight direction

pair_valid_flights <- function(raw_data) {
  
  raw_data %>% mutate(
    trial_id = trial_id,
    first_gate_id = gate_id,
    first_epoch_time = epoch_time,
    second_gate_id = lead(gate_id),
    second_epoch_time = lead(epoch_time)
  ) %>% select(
    trial_id,
    first_gate_id,
    first_epoch_time,
    second_gate_id,
    second_epoch_time
  ) %>% filter( # Removes even numbered entries as they have now been merged with the row above
    row_number() %% 2 != 0,
  )
}