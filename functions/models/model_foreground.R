# model_foreground.R
## GLM with only foreground as fixed effects

model_foreground <- function(data) {
  glm(
    exit_gate_id ~ 
      fg1 +
      fg2,
    data = data,
    family = binomial(link="logit"),
  )
}