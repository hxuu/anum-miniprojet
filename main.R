# main.R - Entry point for Anum-Miniprojet

# Load R scripts dynamically
source_dir <- function(dir) {
  files <- list.files(dir, full.names = TRUE, pattern = "\\.R$")
  sapply(files, source)
}

# Source all algorithms in the R directory
cat("Loading algorithms...\n")
dirs <- list.dirs("R", recursive = TRUE, full.names = TRUE)
for (dir in dirs) {
  source_dir(dir)
}

# "Hello World" Program
cat("\nHello, Numerical Analysis World!\n")
cat("Your project is set up and ready to explore.\n")

