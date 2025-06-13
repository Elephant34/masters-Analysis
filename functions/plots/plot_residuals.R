# plot_residuals.R
## Plots the residuals of the model output

plot_residuals <- function(residuals_data) {
  residuals_data %>%
    ggplot(
      aes(
        x = residual,
        y = flight_id,
        #y = bird_id,
        colour = bird_id
      )
    ) + geom_point(
    ) + scale_y_discrete(
      #guide = guide_axis(n.dodge=2)
      expand = c(0,0)
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
      y = "Flight",
      color = "Bird Identity"
    )
}