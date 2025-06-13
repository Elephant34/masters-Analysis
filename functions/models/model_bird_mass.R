# model_bird_mass.R
## GLM including bird mass as a random effect

model_bird_mass <- function(data) {
  glmer(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (1|mass_g),
    data = data,
    family = binomial(link="logit"),
  )
}