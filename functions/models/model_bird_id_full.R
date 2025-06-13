# model_bird_id_full.R
## GLM including bird id as a random effect and effects if birds respond to the cues differently

model_bird_id_full <- function(data) {
  glmer(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      fg1 +
      fg2 +
      (bg1*fg1) +
      (1|bird_id) +
      (1|bg1) +
      (1|bg2) +
      (1|fg1) +
      (1|fg2),
    data = data,
    family = binomial(link="logit"),
  )
}