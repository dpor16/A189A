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

