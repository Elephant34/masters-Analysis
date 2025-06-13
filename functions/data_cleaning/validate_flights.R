# validate_flights.R
## Adds and filters validation flags to only keep rows whitch pair together as flights through the tunnel
## This function will not discriminate by direction

validate_flights <- function(raw_data, tunnel_cross_threshold_max=1.5, tunnel_cross_threshold_min=0) {
  
  raw_data %>% arrange(
    epoch_time
  ) %>% mutate( # Adds validation flags to the dataset
    # Time to the next gate crossing is less than threshold
    lead_time_check = (lead(epoch_time, default = Inf) - epoch_time) <= tunnel_cross_threshold_max &
      (lead(epoch_time, default = Inf) - epoch_time) >= tunnel_cross_threshold_min,
    
    # The next gate crossing has the same trial_id
    lead_trial_check = lead(trial_id) == trial_id,
    
    # The next gate crossing is not the same gate- i.e. if a bird has jumped through one and sat and then exited the same gate
    lead_gate_check = lead(gate_id) != gate_id,
    
    # Based on the above does the data match as a pair with the following entry
    pair_with_lead = lead_time_check & lead_trial_check & lead_gate_check,
    
    # Is there a conflict where the data could both be paired with previous and next entry
    lag_pair_conflict = lag(pair_with_lead, default=FALSE) & pair_with_lead
  ) %>% filter(
    # Keep rows which pair with the next entry and said next entry
    pair_with_lead | lag(pair_with_lead, default = FALSE),
    # Remove entries where the flight origin/exit is uncertain- where there is a lag pair conflict
    !(lag_pair_conflict | lag(lag_pair_conflict, default=FALSE) | lead(lag_pair_conflict, default=FALSE))
    #!lag(lag_pair_conflict, default=FALSE) & !lead(pair_with_lead, default=FALSE)
  )
}