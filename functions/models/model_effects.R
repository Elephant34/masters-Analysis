# model_effects.R
## Generalised linear model only using the foreground and background terms

model_effects <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      fg1 +
      fg2 +
      bg2,
    data = data,
    family = binomial(link="logit"),
    #weights = ifelse(exit_gate_id == "left", 1/bias_left, 1/bias_right)
  )
}