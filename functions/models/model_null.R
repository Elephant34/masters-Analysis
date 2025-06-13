# model_null.R
## Null model with no fixed effects only residuals

model_null <- function(data) {
  glm(
    exit_gate_id ~ 
      1,
    data = data,
    family = binomial(link="logit"),
  )
}