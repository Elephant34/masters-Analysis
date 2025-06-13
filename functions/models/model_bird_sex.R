# model_bird_sex.R
## GLM including bird sex as a random effect

model_bird_sex <- function(data) {
  #glmer
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1) +
      sex,
    data = data,
    family = binomial(link="logit"),
  )
}