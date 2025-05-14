# generate_normal_contingency_table.R
## Generates a normalised contingency table from the data for any two opposite contrast pairs


generate_normal_contingency_table <- function(count_data, contrast_left, contrast_right) {
  count_data %>% filter(
    {{contrast_left}} != {{contrast_right}}
  ) %>% mutate(
    condition = case_match(
      {{contrast_left}},
      as.factor(0) ~ "left",
      as.factor(1) ~ "right"
    )
  ) %>% select(
    condition,
    normalised_left,
    normalised_right
  ) %>% group_by(condition) %>% summarise(
    left = sum(normalised_left)/4,
    right = sum(normalised_right)/4,
    .groups = "drop"
  ) %>% column_to_rownames(
    "condition"
  ) %>% as.matrix(
  ) %>% as.table(
  )
}