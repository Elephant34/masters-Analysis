# model_glm.R
## Generates my final generalised linear model

model_glm <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1),
    data = data,
    family = binomial(link="logit"),
  )
}