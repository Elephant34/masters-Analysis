# save_figure.R
## Saves the given plot as both an svg and png file

save_figure <- function(figure, filename, size_cm, scaling=1, res=300) {
  save_plot_png(
    figure,
    paste0(filename, ".png"),
    size_cm,
    res = res
  )
  save_plot_svg(
    figure,
    paste0(filename, ".svg"),
    size_cm,
    scaling = scaling
  )
}