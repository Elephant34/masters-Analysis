# add_human_datetime.R
## Adds a column with a human readable datetime to enable easier data comprehension at a glance

add_human_datetime <- function(data) {
  data %>% mutate(
    datetime = anytime(entrance_epoch_time),
  )
}