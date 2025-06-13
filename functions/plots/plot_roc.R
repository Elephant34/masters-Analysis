# plot_roc.R
## Make a ROC plot using the deducer package

plot_roc <- function(model) {
  model %>% 
    Deducer::rocplot(
    ) + plot_theme(
    ) + labs(
      title = "logit(exit_direction ~ bgL + bgR + (bgL * bgR) + fgL + fgR + (bgL*fgL)"
    )
}