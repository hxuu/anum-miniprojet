# Primary logic
finite_differences <- function(x, y, x_query) {
  # Verify equal spacing
  differences <- diff(x)
  if (!all.equal(differences, rep(differences[1], length(differences)))) {
    stop("Error: Data points are not equally spaced!")
  }

  # Proceed with the finite differences algorithm
  n <- length(x)
  diff_table <- matrix(0, nrow = n, ncol = n)
  diff_table[, 1] <- y

  # Construct the difference table
  for (j in 2:n) {
    for (i in 1:(n - j + 1)) {
      diff_table[i, j] <- diff_table[i + 1, j - 1] - diff_table[i, j - 1]
    }
  }

  # Calculate the result using the forward difference formula
  h <- x[2] - x[1]  # Step size (assumed equal spacing)
  result <- y[1]
  term <- 1
  for (i in 1:(n - 1)) {
    term <- term * (x_query - x[i]) / (i * h)
    result <- result + term * diff_table[1, i + 1]
  }

  return(result)
}


if (sys.nframe() == 0) {
        # Apply Finite Differences Interpolation (only when they're equi-distant)
    t_values <- c(0, 2, 4, 6)
    T_values <- c(15, 20, 30, 35)

    t_query <- 3

    finite_result <- finite_differences(t_values, T_values, t_query)

    # Pretty print the reference weather
    cat("\n========================================\n")
    cat("      Reference Weather Information\n")
    cat("========================================\n")
    cat(sprintf("  Hour Queried          : %d\n", t_query))
    cat(sprintf("  Reference Temperature : %.2f°C\n", finite_result))
    cat("========================================\n\n")

    finite_result <- finite_differences(t_values, T_values, t_query)
    cat("[+] Finite Differences result:", finite_result, "°C\n")
}

