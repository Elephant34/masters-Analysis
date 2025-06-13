# calculate_relative_risk_right.R
## Calculates the relative risk with respect to left from a contingency table

calculate_relative_risk_right <- function(contingency_table) {
  (
    contingency_table[2,2] / sum(contingency_table[2,]) # P(R|Bg2C)
  ) / (
    contingency_table[1,2] / sum(contingency_table[1,]) # P(R|Bg1C)
  )
}