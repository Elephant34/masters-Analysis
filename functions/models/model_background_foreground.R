# model_background_foreground.R
## GLM with foreground and background as fixed effects

model_background_foreground <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      fg1 +
      fg2,
    data = data,
    family = binomial(link="logit"),
  )
}