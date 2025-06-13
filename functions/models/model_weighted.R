# model_weighted.R
## Generates a glm with weighting for the left/right bias included. GRAHAM IS AGAINST THIS

model_weighted <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      fg1 +
      fg2 +
      (bg1*fg1),
    data = data,
    family = binomial(link="logit"),
    #offset = 0.16
    weights = ifelse(exit_gate_id == "left", 1/bias_left, 1/bias_right)
  )
}