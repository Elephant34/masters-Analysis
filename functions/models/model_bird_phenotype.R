# model_bird_phenotype.R
## GLM including bird phenotype as a random effect

model_bird_phenotype <- function(data) {
  glmer(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (1|phenotype),
    data = data,
    family = binomial(link="logit"),
  )
}