# plot_normalised_overall_results.R
## Plot showing the overall results not including bird_id normalised to the number of flights per trial

plot_normalised_overall_results <- function(data) {
  
  data %>% group_by(
    trial_id
  ) %>% mutate(
    n_flights = n()
  ) %>% ungroup(
  ) %>% group_by(
    trial_id,
    exit_gate_id
  ) %>% summarise(
    exit_gate_value = sum(exit_gate_value),
    n_flights = first(n_flights),
    .groups = "drop"
  ) %>% mutate(
    normalised_value = exit_gate_value / n_flights
  ) %>%
    ggplot(
      aes(
        x = trial_id,
        y = normalised_value,
        fill = exit_gate_id
      )
    ) + geom_col(
    ) + geom_hline(
      yintercept = 0,
      linewidth = 1,
      color = "white"
    ) + scale_y_continuous(
      breaks = seq(-1, 1, by = 0.1),
      labels = abs
    ) + direction_fill_viridis(
    ) + plot_theme(
    ) + labs(
      title = "Normalised Flight Direction per Trial State",
      x = "Trial State",
      y = "Proportion of Flights per Trial",
      fill = "Direction"
    ) + coord_flip(
    ) + theme(
      axis.title.y = element_text(margin = margin(t = 0, r = 70, b = 0, l = 0))
    )
}