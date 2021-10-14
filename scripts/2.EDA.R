##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: R practice
## Author: Ege Ulgen
##################################################

# read data ---------------------------------------------------------------
setwd("/Users/egeulgen/Documents/Teaching/MED131_21_22")

aids_df <- read.delim("data/aids_dataset.txt", sep = " ")

# print first 6 rows (default)
head(aids_df)

# print first 2 rows
head(aids_df, n = 2)

# print last 6 rows
tail(aids_df)

table(aids_df$treatment)
table(aids_df$gender)

# mean/median/mode --------------------------------------------------------

# mean of age
mean(aids_df$age)

# mean of CD4 count at week 1
mean(aids_df$cd4_1)

# median of CD4 count at week 2
median(aids_df$cd4_2)

# mode of CD4 count at week 1
tbl <- table(aids_df$cd4_1)
sort(tbl, decreasing = TRUE)


# percentiles -------------------------------------------------------------

# 10th, 25th, 33rd and 78th percentiles of age
quantile(aids_df$age, probs = c(0.1, 0.25, 0.33, 0.78))


# spread ------------------------------------------------------------------
# range of CD4 counts at week 1
max(aids_df$cd4_1) - min(aids_df$cd4_1)

### IQR of CD4 counts at week 1
IQR(aids_df$cd4_1)

# Variance of CD4 counts at week 1
var(aids_df$cd4_1)

# Std. deviation of CD4 counts at week 1
sd(aids_df$cd4_1)


# outliers ----------------------------------------------------------------
### Outliers for CD4 counts at weeek 1
boxplot(aids_df$cd4_1)

Q1 <- quantile(aids_df$cd4_1, 0.25)
Q3 <- quantile(aids_df$cd4_1, 0.75)

IQR_val <- IQR(aids_df$cd4_1)

UL <- Q3 + 1.5 * IQR_val
LL <- Q1 - 1.5 * IQR_val

aids_df$cd4_1[aids_df$cd4_1 > UL]
aids_df$cd4_1[aids_df$cd4_1 < LL]
aids_df$cd4_1[aids_df$cd4_1 > UL | aids_df$cd4_1 < LL]

# summary -----------------------------------------------------------------
summary(aids_df$cd4_1)

summary(aids_df)
