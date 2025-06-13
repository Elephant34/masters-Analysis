# model_only_interactions.R
## Generaslied linear model only using the interaction terms between foreground and background

model_only_interactions <- function(data) {
  glm(
    exit_gate_id ~ 
      (bg1*bg2) +
      (bg1*fg1) +
      (fg1*fg2) +
      (fg2*bg2),
    # contrast_bg1_bg2 +
    # contrast_bg1_fg1 +
    # contrast_fg1_fg2 +
    # contrast_fg2_bg2,
    data = data,
    family = binomial(link="logit"),
    #weights = ifelse(exit_gate_id == "left", 1/bias_left, 1/bias_right)
  )
}