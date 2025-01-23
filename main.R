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
cat("Your project is set up and ready to explore.\n\n")

# ######################################################
# NEW CODE: Reference Weather at Hour 16
# ######################################################

# Read data from CSV file
data <- read.csv("weatherHistory.csv")

# Convert 'Formatted' date column to POSIXct for easier manipulation
data$Formatted <- as.POSIXct(data$Formatted, format="%Y-%m-%d %H:%M:%OS %z")

# Split 'Formatted' column into its components (year, month, day, hour, minute, etc.)
data$Year <- format(data$Formatted, "%Y")
data$Month <- format(data$Formatted, "%m")
data$Day <- format(data$Formatted, "%d")
data$Hour <- format(data$Formatted, "%H")
data$Minute <- format(data$Formatted, "%M")
data$Second <- format(data$Formatted, "%S")

# Get all temperatures for a specific date, for example, "2006-04-01"
selected_date <- "2006-04-01"
filtered_data <- data[data$Year == "2006" & data$Month == "04" & data$Day == "01", ]

# Check if data for hour 16 exists
reference_weather <- filtered_data[filtered_data$Hour == "16", ]

# Display the reference weather data
if (nrow(reference_weather) > 0) {
  cat("[+] Reference weather at hour 16 (", selected_date, "): ")
  cat(reference_weather$Temperature, "degrees.\n\n")
} else {
  cat("[!] No reference weather data available for hour 16 on", selected_date, "\n")
}

# Remove the row where Hour is 16 and Temperature is 16
filtered_data <- filtered_data[!(filtered_data$Hour == 16), ]

# Extract t_values and T_values
t_values <- as.numeric(filtered_data$Hour)
T_values <- as.numeric(filtered_data$Temperature)

# Query time for which we want to predict the temperature
t_query <- 16

# Apply Lagrange Interpolation
lagrange_result <- lagrange_interpolation(t_values, T_values, t_query)
cat("[+] Lagrange Interpolation result:", lagrange_result, "\n\n")

# Apply Divided Differences Interpolation
divided_result <- divided_differences(t_values, T_values, t_query)
cat("[+] Divided Differences result:", divided_result, "\n\n")

# Apply Finite Differences Interpolation (only when they're equi-distant)
# finite_result <- finite_differences(t_values, T_values, t_query)
# cat("[+] Finite Differences result:", finite_result, "\n\n")

# ######################################################
# END OF NEW CODE
# ######################################################

