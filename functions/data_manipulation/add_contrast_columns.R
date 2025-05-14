# add_contrast_columns.R
## Adds contrast columns based on contextualised trial_id

add_contrast_columns <- function(trial_id_contextualised_data) {
  trial_id_contextualised_data %>% mutate(
    temp_bg1 = as.numeric(as.factor(bg1)),
    temp_fg1 = as.numeric(as.factor(fg1)),
    temp_fg2 = as.numeric(as.factor(fg2)),
    temp_bg2 = as.numeric(as.factor(bg2)),
    contrast_bg1_bg2 = temp_bg1 - temp_bg2,
    contrast_bg1_fg1 = temp_bg1 - temp_fg1,
    contrast_fg1_fg2 = temp_fg1 - temp_fg2,
    contrast_fg2_bg2 = temp_fg2 - temp_bg2
  ) %>% select(
    -starts_with("temp_")
  )
}