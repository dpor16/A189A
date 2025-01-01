# Read in your CSV file
df<- read_csv("Top_200_Movies_Dataset_2023(Cleaned).csv")
head(df)
dfsummary<- summary(df)

#DATA CLEANING AND PREPROCESSING
# Step 1: Clean and convert Theaters and Total Gross columns'

# Remove commas from Theaters and convert to numeric
df$Theaters <- as.numeric(gsub(",", "", df$Theaters))

# Remove "$" and commas from Total Gross and convert to numeric
df$`Total Gross` <- as.numeric(gsub("[\\$,]", "", df$`Total Gross`))

# Step 2: Check for missing values
sum(is.na(df$Theaters))  # Check missing values in Theaters
sum(is.na(df$`Total Gross`))  # Check missing values in Total Gross

# Step 3: Remove rows with missing values
df <- na.omit(df)

#DESCRIPTIVE AND EXPLORATORY ANALYSIS
# # Step 1: Descriptive statistics for numerical variables
summary(df$Theaters)  # Summary of Theaters
summary(df$`Total Gross`)  # Summary of Total Gross

# Calculate standard deviation for more insights
sd(df$Theaters)  # Standard deviation of Theaters
sd(df$`Total Gross`)  # Standard deviation of Total Gross

# Step 2: Visualize distributions
# Plot the histogram of Theaters
hist(df$Theaters, breaks = 30, col = "skyblue", main = "Histogram of Theaters with Bell Curve",
     xlab = "Number of Theaters", probability = TRUE)

# Add a density curve (smooth bell curve)
lines(density(df$Theaters), col = "red", lwd = 2)

# Overlay a normal curve using mean and standard deviation
curve(dnorm(x, mean = mean(df$Theaters), sd = sd(df$Theaters)), 
      col = "darkgreen", lwd = 2, add = TRUE)

# Plot the histogram of Total Gross
hist(df$`Total Gross`, breaks = 30, col = "pink", main = "Histogram of Total Gross with Bell Curve",
     xlab = "Total Gross ($)", probability = TRUE)

# Add a density curve (smooth bell curve)
lines(density(df$`Total Gross`), col = "red", lwd = 2)

# Overlay a normal curve using mean and standard deviation
curve(dnorm(x, mean = mean(df$`Total Gross`), sd = sd(df$`Total Gross`)), 
      col = "darkgreen", lwd = 2, add = TRUE)


# Boxplots to detect outliers
boxplot(df$Theaters, main = "Boxplot of Theaters", ylab = "Number of Theaters", col = "lightgreen")
boxplot(df$`Total Gross`, main = "Boxplot of Total Gross", ylab = "Total Gross ($)", col = "lightcoral")


Statistical Analysis & Correlation Testing
# Step 1: Correlation Coefficient
correlation <- cor(df$Theaters, df$Total Gross, method = "pearson")
print(paste("Correlation Coefficient: ", correlation))

# Step 2: Hypothesis Testing for Correlation
cor.test(df$Theaters, df$Total Gross)

# Step 3: Scatterplot with Regression Line
plot(df$Theaters, df$Total Gross, 
     main = "Scatterplot of Theaters vs. Total Gross", 
     xlab = "Number of Theaters", ylab = "Total Gross ($)", 
     col = "blue", pch = 19)

# Add regression line
abline(lm(df$Total Gross ~ df$Theaters), col = "red", lwd = 2)
