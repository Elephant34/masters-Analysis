# model_background_foreground_bg_interaction
## Models background foreground and interaction of background

model_background_foreground_bg_interaction <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1*bg2) +
      fg1 +
      fg2,
    data = data,
    family = binomial(link="logit"),
  )
}