# plot_trial_ids.R
## Plot showing the distribution of flights across the different trials

plot_trial_ids <- function(data) {
  data %>% ggplot(
    aes(
      x = trial_id,
      fill = trial_id
    )
  ) + geom_bar(
    
  ) + geom_hline(
    yintercept = data %>% nrow() * (1/8),
    linewidth = 1,
    linetype = "dashed"
  ) + scale_fill_viridis(
    option = "D",
    discrete = TRUE
  ) + plot_theme(
  ) + hide_legend(
  ) + labs(
    x = "Trial State",
    y = "Number of Flights",
    title = "Number of Flights per Trial State"
  ) + theme(
    axis.title.x = element_text(margin = margin(t = 30, r = 0, b = 0, l = 0))
  )
}