# model_background_foreground_fg_interaction.R
## Models background foreground and interaction of foreground

model_background_foreground_fg_interaction <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      fg1 +
      fg2 +
      (fg1*fg2),
    data = data,
    family = binomial(link="logit"),
  )
}