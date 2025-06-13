# plot_overall_results.R
## Plot showing the overall results not including bird_id

plot_overall_results <- function(data) {
  data %>%
    ggplot(
      aes(
        x = trial_id,
        y = exit_gate_value,
        fill = exit_gate_id
      )
    ) + geom_col(
    ) + geom_hline(
      yintercept = 0,
      linewidth = 1,
      color = "white"
    ) + scale_y_continuous(
      breaks = seq(-90, 30, by=10),
      labels = abs
    ) + direction_fill_viridis(
    ) + plot_theme(
    ) + labs(
      title = "Flight Direction per Trial",
      x = "Trial State",
      y = "Number of Flights",
      fill = "Direction"
    ) + coord_flip(
    )
}