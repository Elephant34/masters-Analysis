# model_full.R
## Generalised linear model including all effects and interactions- results in 3 singularities

model_full <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (fg1*fg2) +
      (bg1*fg1) +
      (fg2*bg2) +
      (bg1*fg2) +
      (fg1*bg2),
    data = data,
    family = binomial(link="logit")
  )
}