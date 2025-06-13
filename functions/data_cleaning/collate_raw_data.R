# collate_raw_data.R
## Collates the raw data files into a single tibble

collate_raw_data <- function(raw_data_dir) {
  # Gets all the CSV files from one directory and collates them into a single tibble
  
  raw_data_dir %>% fs::dir_ls( # Gets the files
    glob="*.csv"
  ) %>% purrr::map_df( # Reads the files
    read_csv
  )
}