# calculate_left_bias.R
## Calculates the overall probability of birds flying left in the data

calculate_left_bias <- function(data) {
  data %>% filter(exit_gate_id == "left") %>% nrow() / 
    data %>% nrow()
    
}