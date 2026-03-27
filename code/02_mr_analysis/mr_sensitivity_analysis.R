# mr_sensitivity_analysis.R

# Load required libraries
library(MASS)
library(MRPRESSO)

# Function for Leave-One-Out Analysis
leave_one_out_analysis <- function(data) {
  results <- list()
  for (i in 1:nrow(data)) {
    subset_data <- data[-i, ]
    # Perform MR analysis on subset_data
    results[[i]] <- perform_mr_analysis(subset_data) # assuming perform_mr_analysis is defined elsewhere
  }
  return(results)
}

# Function for MR-PRESSO Pleiotropy Testing
mr_presso_testing <- function(data) {
  presse_result <- mr_presso(data, NbOfSamples = 1000, Sign = 0.05)
  return(presse_result)
}

# Function for Steiger Directionality Filtering
steiger_filtering <- function(data) {
  steiger_results <- steiger_test(data) # assuming steiger_test is defined elsewhere
  filtered_data <- data[steiger_results$directional == TRUE, ]
  return(filtered_data)
}

# Example of using the defined functions
# data <- load_data() # Load your data here
# loo_results <- leave_one_out_analysis(data)
# presso_results <- mr_presso_testing(data)
# filtered_data <- steiger_filtering(data)
