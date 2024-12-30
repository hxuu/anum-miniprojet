# Primary logic
divided_differences <- function(x, y, query) {
  n <- length(x)
  table <- matrix(0, n, n)
  table[, 1] <- y

  for (j in 2:n) {
    for (i in 1:(n-j+1)) {
      table[i, j] <- (table[i+1, j-1] - table[i, j-1]) / (x[i+j-1] - x[i])
    }
  }

  # Construct the Newton polynomial
  result <- table[1, 1]
  product <- 1
  for (i in 2:n) {
    product <- product * (query - x[i-1])
    result <- result + product * table[1, i]
  }

  return(result)
}

