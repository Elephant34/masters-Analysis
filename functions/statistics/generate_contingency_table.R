# generate_contingency_table.R
## Generates a contingency table from the data for any two opposite contrast pairs


generate_contingency_table <- function(count_data, contrast_left, contrast_right) {
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
    left,
    right
  ) %>% group_by(condition) %>% summarise(
    left = sum(left),
    right = sum(right),
    .groups = "drop"
  ) %>% column_to_rownames(
    "condition"
  ) %>% as.matrix(
  ) %>% as.table(
  )
}