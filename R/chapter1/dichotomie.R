# The code below is hard-coded.

# Input
a <- 10;
b <- 20;
epsilon <- 0.5 * 10^(-2);

# Function definition
f <- function(x) {
    # expression
}

# Primary logic
dichotomie <- function(a, b, eps) {
    N_eps <- ceiling(log2((b - a) / epsilon) - 1);
    t <- a;
    s <- b;

    for (k in 0:N) {
        x <- (t+s) / 2;

        if (f(t) * f(s) < 0) {
            t <- t;
            s <- x;
        } else {
            t <- x;
            s <- s;
        }
    }
}
