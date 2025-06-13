# model_full_far_egde.R
## GLM of background foreground interactions only including near edges

model_full_far_egde <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2 +
      (fg1*fg2)+
      (bg1*fg2),
    data = data,
    family = binomial(link="logit"),
  )
}