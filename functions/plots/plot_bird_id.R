# plot_bird_id.R
## Plot showing the number of times each bird flew through the setup

plot_bird_id <- function(data) {
  data %>% group_by(
    bird_id
  ) %>% mutate(
    count_ordering= n()
  ) %>% ungroup(
  ) %>%
    ggplot(
      aes(
        x = reorder(bird_id, -count_ordering),
        fill = trial_id
      )
    ) + geom_bar(
      
    ) + scale_fill_viridis(
      discrete = TRUE,
      option = "D"
    ) + scale_x_discrete(
      guide = guide_axis(angle = 90)
    ) + plot_theme(
    ) + labs(
      x = "Bird ID Number",
      y = "Number of Flights",
      title = "Number of Flights by Zebra Finch",
      fill = "Trial State"
    ) + theme(
      axis.title.x = element_text(margin = margin(t = 30, r = 0, b = 0, l = 0))
    )
}
