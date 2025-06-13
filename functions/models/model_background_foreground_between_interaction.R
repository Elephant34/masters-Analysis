# model_background_foreground_between_interaction.R
## GLM with foreground, background and all the possible interactions between them as fixed effects

model_background_foreground_between_interaction <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (bg2*fg2) +
      (bg1*fg2) +
      (fg1*bg2),
    data = data,
    family = binomial(link="logit"),
  )
}