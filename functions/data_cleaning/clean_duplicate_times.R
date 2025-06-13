# clean_duplicate_times.R
## Removes rows from the raw data with the same gate_id and within the a threshold length of time

clean_duplicate_times <- function(raw_data, duplicate_threshold = 1){
  raw_data %>% group_by(
    gate_id
  ) %>% mutate(
    # Generates blocks based on the gate_id and the threshold times
    block_id = {
      block_id <- numeric(n())
      current_block <- 1
      start_time <- epoch_time[1]
      
      block_id[1] <- current_block
      
      for (i in 2:n()) {
        if (epoch_time[i] - start_time > duplicate_threshold) {
          current_block <- current_block + 1
          start_time <- epoch_time[i]
        }
        block_id[i] <- current_block
      }
      block_id
    }
  ) %>% ungroup(
  ) %>% arrange(
    epoch_time
  ) %>% mutate(
    keep = !((lag(block_id) == block_id) & (lag(gate_id) == gate_id)),
    keep = replace_na(keep, TRUE)
  ) %>% filter(
    keep
  ) %>% select(
    -block_id,
    -keep
  )
}