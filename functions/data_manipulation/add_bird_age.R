# add_bird_age.R
## Using the birth year of the birds calculates the age in days at the start of the experiment

add_bird_age <- function(data, start_date_str) {
  start_time = anytime(start_date_str)
  
  print
  
  data %>% mutate(
    age_days = if_else(
      is.na(birth_date),
      NA,
      as.integer(start_time - anytime(birth_date))
    )
  ) %>% select(
    -birth_date
  )
}