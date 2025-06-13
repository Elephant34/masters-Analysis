# plot_theme.R
## Default theme to be applied to all plots

plot_theme <- function() {
  theme_bw() %+replace%
    theme(
      text = element_text(family="sans")
    )
}