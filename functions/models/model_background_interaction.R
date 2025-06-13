# model_background_interaction.R
## Model including background and interaction between backgrounds

model_background_interaction <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      (bg1 * bg2),
    data = data,
    family = binomial(link="logit"),
  )
}