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

