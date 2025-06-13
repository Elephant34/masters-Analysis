# direction_fill_viridis.R
## Left/Right discrete colours using viridis

direction_fill_viridis <- function() {
  scale_fill_viridis(
    discrete = TRUE,
    option = "D",
    begin = 0.5
  )
}