# Two-Sample MR Analysis Functions for Multi-Ancestry Causal Inference

# This script includes functions for conducting two-sample Mendelian Randomization (MR) analysis
# tailored for multi-ancestry datasets.

# Function 1: Estimate causal effect using IVW method
estimate_causal_effect_ivw <- function(exposure_beta, exposure_se, outcome_beta, outcome_se) {
  # Calculating the inverse variance weighted (IVW) estimator
  weights <- 1 / (exposure_se^2 + outcome_se^2)
  causal_effect <- sum(weights * (exposure_beta - outcome_beta)) / sum(weights)
  return(causal_effect)
}

# Function 2: Estimate causal effect using MR-Egger method
estimate_causal_effect_mregger <- function(exposure_beta, exposure_se, outcome_beta, outcome_se) {
  # Calculating the MR-Egger estimator
  # Adjusting for pleiotropy using intercept from regression
  df <- data.frame(exposure_beta, exposure_se, outcome_beta, outcome_se)
  mregger_model <- lm(outcome_beta ~ exposure_beta, data = df)
  return(coef(mregger_model)[2])  # return slope as causal effect
}

# Function 3: Sensitivity analysis using leave-one-out method
sensitivity_analysis_leave_one_out <- function(exposure_beta, exposure_se, outcome_beta, outcome_se) {
  results <- sapply(1:length(exposure_beta), function(i) {
    adjusted_exposure_beta <- exposure_beta[-i]
    adjusted_outcome_beta <- outcome_beta[-i]
    estimate_causal_effect_ivw(adjusted_exposure_beta, exposure_se[-i], adjusted_outcome_beta, outcome_se[-i])
  })
  return(results)
}

# Example usage (uncomment to run)
# exposure_beta <- c(0.1, 0.2, 0.15)
# exposure_se <- c(0.01, 0.02, 0.015)
# outcome_beta <- c(0.05, 0.1, 0.07)
# outcome_se <- c(0.005, 0.01, 0.007)
# causal_effect_ivw <- estimate_causal_effect_ivw(exposure_beta, exposure_se, outcome_beta, outcome_se)
# causal_effect_mregger <- estimate_causal_effect_mregger(exposure_beta, exposure_se, outcome_beta, outcome_se)
# sensitivity_results <- sensitivity_analysis_leave_one_out(exposure_beta, exposure_se, outcome_beta, outcome_se)
