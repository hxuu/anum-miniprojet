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

# ######################################################
# NEW CODE: Testing the Interpolation Methods (Lagrange, Divided Differences, Finite Differences)
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

# Assuming the filtered data is stored in a variable named `filtered_data`

# print(head(filtered_data$Hour))
# Remove the row where Hour is 16 and Temperature is 16
# print(filtered_data)
# quit()
filtered_data <- filtered_data[!(filtered_data$Hour == 16), ]
# print(filtered_data$Hour)
# print(filtered_data$Temperature)

# Extract t_values and T_values
t_values <- as.numeric(filtered_data$Hour)
T_values <- as.numeric(filtered_data$Temperature)

# Print the extracted t_values and T_values for verification
print(t_values)
print("==================================")
print(T_values)

quit()
# Now, you can apply any function for estimation, if needed

# quit()

# Query time for which we want to predict the temperature
t_query <- 16

# Apply Lagrange Interpolation
lagrange_result <- lagrange_interpolation(t_values, T_values, t_query)
cat("Lagrange Interpolation result:", lagrange_result, "\n")

# Apply Divided Differences Interpolation
divided_result <- divided_differences(t_values, T_values, t_query)
cat("Divided Differences result:", divided_result, "\n")

# Apply Finite Differences Interpolation
finite_result <- finite_differences(t_values, T_values, t_query)
cat("Finite Differences result:", finite_result, "\n")

# ######################################################
# END OF NEW CODE
# ######################################################

