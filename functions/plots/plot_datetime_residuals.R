# plot_datetime_residuals.R
## Plots the residuals of the model output

plot_datetime_residuals <- function(residuals_data) {
  residuals_data %>%
    ggplot(
      aes(
        x = residual,
        y = datetime,
        colour = bird_id
      )
    ) + geom_point(
    ) + scale_y_datetime(
      breaks = scales::pretty_breaks(n=14),
      date_labels = "%Y-%m-%d"
    ) + scale_x_continuous(
      breaks = seq(-2.5, 15, by=2.5),
      labels = seq(-2.5, 15, by=2.5),
      limits = c(-2.5, 15)
    ) + scale_color_viridis(
      discrete = TRUE,
      option = "D"
    ) + plot_theme(
    ) + labs(
      title = "Residual Plot of GLM Output",
      x = "Model Residuals",
      y = "Date",
      color = "Bird Identity"
    )
}