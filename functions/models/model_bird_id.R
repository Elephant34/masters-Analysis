# model_bird_id.R
## GLM including bird id as a random effect

model_bird_id <- function(data) {
  glmer(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (1|bird_id),
    data = data,
    family = binomial(link="logit"),
  )
}