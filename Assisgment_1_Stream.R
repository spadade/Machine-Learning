# Source of DataSet: 
# https://dasl.datadescription.com/datafiles/?_sfm_cases=4+59943&sort_order=modified+desc&sf_paged=9

# Read the dataset.
Stream_Statistics <- read.csv("Streams.csv")

# Print the 1st 5 entries of each column.
head(Stream_Statistics, 5)

#---------------------- Descriptive Statisticsof the dataset ---------------------------

summary(Stream_Statistics)

# 1. Mean
mean(Stream_Statistics$pH)

# 2. Mediam
median(Stream_Statistics$Temp)

# 3. Mode
require(modeest)
mfv(Stream_Statistics$pH)

# 4. Variance
var(Stream_Statistics$Hard)

# 5. Standard Deviation
sd(Stream_Statistics$Alkali)

# 6. Absolute Deviation
mad(Stream_Statistics$Phosphate)

# 7. Minimum Value
min(Stream_Statistics$Hard)

# which row has a minimum value
Stream_Statistics[which.min(Stream_Statistics$Hard),]

# 8. Maximum Value
max(Stream_Statistics$Alkali)

# Which row has a maximum value
Stream_Statistics[which.max(Stream_Statistics$Alkali),]

# 9. Range
range(Stream_Statistics$Temp)

#Quantile
quantile(Stream_Statistics$Phosphate)
IQR(Stream_Statistics$Phosphate)

#------------------------ Transformation ----------------------------------------------

library(rcompanion)       # Library require for function plotNormalHistogram

# Histogram for pH value
plotNormalHistogram(Stream_Statistics$pH, main = "Normal pH")

# 1. Square Root Transformation

Sq_Trans = sqrt(Stream_Statistics$pH)
print("Square transformation of pH")
print(head(Sq_Trans), 5)

plotNormalHistogram(Sq_Trans, main = "Square Root Transformed pH")

# 2. Cube Root Transformation

C_Trans = abs(Stream_Statistics$pH)^(1/3)
print("Cube Transformation of pH")
print (head(C_Trans),5)

plotNormalHistogram(C_Trans, main = "Cube Root Transformed pH")

# 3. Log Transformation

log_Trans = log(Stream_Statistics$pH)
print("Log Transformation of pH")
print(head(log_Trans), 5)

plotNormalHistogram(log_Trans, main = "Log Root Transformed pH")

#----------------------- Graphical Representation ----------------------------------------------------------------------------

# Boxplot
plot(Stream_Statistics$Substrate, Stream_Statistics$pH, xlab = "Substrate", ylab = "pH", main = "Substrate vs pH of Streams")

# Bar Chart - Plotted a graph of number of different substrate
barplot(table(Stream_Statistics$Substrate), xlab = "Substrate", ylab = "Count", main = "Count of Substrate")

# Scatter Plot
plot.default(Stream_Statistics$pH, Stream_Statistics$Hard, xlab = "pH of Stream", ylab = "Hardness", main = "pH vs Hardness of different Stream Water")
