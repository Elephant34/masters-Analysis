# model_background.R
## GLM with only background as fixed effects

model_background <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2,
    data = data,
    family = binomial(link="logit"),
  )
}