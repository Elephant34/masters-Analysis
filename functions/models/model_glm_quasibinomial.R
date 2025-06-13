# model_glm_quasibinomial.R
## Generates a generalised linear model with quasibinomial to account for underdispersion

model_glm_quasibinomial <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1),
    data = data,
    family = quasibinomial(link="logit"),
  )
}