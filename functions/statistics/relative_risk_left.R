# relative_risk_left.R
## Calculates the relative risk with respect to left from a contingency table

relative_risk_left <- function(contingency_table) {
  (
    contingency_table[1,1] / sum(contingency_table[1,]) # P(L|Bg1C)
  ) / (
    contingency_table[2,1] / sum(contingency_table[2,]) # P(L|Bg2C)
  )
}