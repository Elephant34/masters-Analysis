# hide_legend.R
## Removes the legend from a ggplot

hide_legend <- function() {
  guides(
    fill = "none",
    color = "none"
  )
}