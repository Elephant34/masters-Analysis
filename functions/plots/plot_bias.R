# plot_bias.R
## Plot showing the overall left right bias of the dataset

plot_bias <- function(data) {
  data %>% ggplot(
    aes(
      x = exit_gate_id,
      fill = exit_gate_id
    )
  ) + geom_bar(
    
  ) + direction_fill_viridis(
  ) + plot_theme(
  ) + hide_legend(
  ) + labs(
    x = "Exit Direction",
    y = "Number of Flights",
    title = "Number of Flights per Direction"
  )
}