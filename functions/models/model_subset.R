# model_subset.R
## GLM using only subset of trails 1-4 to look at brightness with fixed foreground

model_subset <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      fg1 +
      (bg1*fg1),
    data = data,
    family = binomial(link="logit"),
  )
}