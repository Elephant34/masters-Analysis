# model_foreground_interaction.R
## Model including foreground and interaction between foregrounds

model_foreground_interaction <- function(data) {
  glm(
    exit_gate_id ~ 
      fg1 +
      fg2 +
      (fg1 * fg2),
    data = data,
    family = binomial(link="logit"),
  )
}