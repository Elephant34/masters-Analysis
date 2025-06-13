# model_testing.R
## Function to quickly test out different generalised linear models

model_testing <- function(data) {
  glm(
    exit_gate_id ~ 
      bg1 +
      bg2 +
      #(bg1*bg2) +
      fg1 +
      fg2 +
      (bg1*fg1),
    data = data,
    family = binomial(link="logit"),
  )
}