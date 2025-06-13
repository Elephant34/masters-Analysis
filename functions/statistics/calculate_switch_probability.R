# calculate_switch_probability.R
## Calculate the probability of switching from flying to the negative condition to flying towards the positive condition
## This metric takes into account the intrinsic side bias displayed by the birds

## Statistic calculations worked out in conversation with Zaheen A-Rahman

calculate_switch_proability <- function(contingency_table, bias_left, bias_right) {
  
  condition_left_exit_left <- contingency_table[1,1]
  condition_left_exit_right <- contingency_table[1,2]
  condition_left_total <- sum(contingency_table[1,])
  
  condition_right_exit_left <- contingency_table[2,1]
  condition_right_exit_right <- contingency_table[2,2]
  condition_right_total <- sum(contingency_table[2,])
  
  table_total = sum(contingency_table)
  
  probability_condition_left <- condition_left_total / table_total
  probability_condition_right <- condition_right_total / table_total
  
  # Increase in number of flights going light - expected left
  switch_condition_left <- condition_left_exit_left - (condition_left_total*bias_left)
  
  # Increase in number of flights going light vs expected right
  switch_bright_right <- condition_right_exit_right - (condition_right_total*bias_right)
  
  probability_condition_left_switch_left <- (switch_condition_left/(switch_condition_left+condition_left_exit_right)) * probability_condition_left
  probability_condition_right_switch_right <- (switch_bright_right/(switch_bright_right+condition_right_exit_left)) * probability_condition_right
  
  probability_switch_condition <- probability_condition_left_switch_left + probability_condition_right_switch_right
  probability_switch_condition
}