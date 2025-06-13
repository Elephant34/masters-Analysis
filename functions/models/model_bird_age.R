# model_bird_age.R
## GLM including bird age as a random effect

model_bird_age <- function(data) {
  glmer(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (1|age_days),
    data = data,
    family = binomial(link="logit"),
  )
}