# add_gate_value_column.R
## Adds an additional column converting exit_gate_id "left" = 0 and "right" = 1

add_gate_value_column <- function(data) {
  data %>% mutate(
    exit_gate_value = case_match(
      exit_gate_id,
      "left" ~ -1,
      "right" ~ 1
    )
  )
}