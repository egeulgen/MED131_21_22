##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: Introduction to R
## Author: Ege Ulgen
##################################################

# Sample Session ----------------------------------------------------------

# This is a comment
# print a number
2 

2 + 3 # perform a simple calculation
2 * 3 

# natural log
log(2)

# working directory -------------------------------------------------------
# Return current working directory
getwd()

# Set working directory
setwd("/Users/egeulgen/Documents/Teaching/21_22_Undergrad/scripts")

# special characters in R -------------------------------------------------s
# NA: Not Available (i.e. missing values)
# NaN: Not a Number (e.g. 0/0)
0/0
# Inf: Infinity
# -Inf: Minus Infinity. For instance 0 divided by 0 gives a NaN, but 1 divided by 0 gives Inf.
1/0

# numeric and string objects ----------------------------------------------
### Numeric objects
# store an object
x <- 2
x # print this object

# store and print an object
(y <- 3)

# perform simple calculations
x + y
x * 3 + y * 2

# update an object to be doubled
x <- 2 * x

### String objects
x <- "Hello"
x

(y <- "World")

# concatenate the two words
paste(x, y)

# vectors -----------------------------------------------------------------
# store a vector
height <- c(168, 177, 177, 177, 178, 172, 165, 171, 178, 170)

# print the second element
height[2]

# print from the 2nd to the 5th element
height[2:5]

# Define a vector as a sequence (1 to 10)
(obs <- 1:10)

# define a regular sequence
seq(1, 10)
seq(1, 10, by = 2)

# Perform a simple calculation using vectors (element-wise)
weight <- c(88, 72, 85, 52, 71, 69, 61, 61, 51, 75)

BMI <- weight / ((height / 100) ^ 2)
BMI

### simple descriptions of the vector
# length
length(height)

### string vectors
eye_color <- c("blue", "green", "brown", "blue", "brown", 
               "blue", "blue", "green", "brown", "brown")

table(eye_color)

table(eye_color) / 10
table(eye_color) / 10 * 100

### appending to and deleting from a vector
# empty vector
my_vec <- c()
# append to vector
my_vec <- c(my_vec, 3)
my_vec
my_vec <- c(1, 2, my_vec)
my_vec

# delete an element
my_vec[2]
my_vec <- my_vec[-2]
my_vec

# simple plotting ---------------------------------------------------------

### bar plot
freq_tbl <- table(eye_color)
?barplot
barplot(freq_tbl)

barplot(freq_tbl, horiz = TRUE)

barplot(freq_tbl, 
        xlab = "Eye-colour",
        ylab = "Frequency",
        main = "Bar-plot of the eye-colour data")

barplot(freq_tbl, 
        xlab = "Eye-colour",
        ylab = "Frequency",
        main = "Bar-plot of the eye-colour data",
        col = "white")

barplot(freq_tbl, 
        xlab = "Eye-colour",
        ylab = "Frequency",
        main = "Bar-plot of the eye-colour data",
        col = c("blue", "brown", "green"))

###  histogram of weight
hist(weight)
hist(weight, freq = FALSE)
hist(weight, breaks = 10)
hist(weight, breaks = 10, col = "blue")

### Cholesterol data
chol_vec <- c(213, 174, 193, 196, 220, 183, 194, 200, 192, 200, 200, 199, 178,
              183, 188, 193, 187, 181, 193, 205, 196, 211, 202, 213, 216, 206,
              195, 191, 171, 194, 184, 191, 221, 212, 221, 204, 204, 191, 183, 227)
hist(chol_vec)
hist(chol_vec, breaks = 15)

grp1 <- chol_vec[1:20]
grp2 <- chol_vec[21:40]
hist(grp1, col = "red", main = "Group 1 - Distribution")
hist(grp2, col = "blue", main = "Group 2 - Distribution")


min(chol_vec)
max(chol_vec)

hist(grp1, col = "red", main = "Distribution by Group", 
     xlim = c(170, 230), ylim = c(0, 10))
hist(grp2, col = "blue",
     xlim = c(170, 230), ylim = c(0, 10), add = TRUE)




hist(grp1, col = rgb(red = 1, green = 0, blue = 0, alpha = 0.5), 
     main = "Distribution by Group", 
     xlim = c(170, 230), ylim = c(0, 10),
     xlab = NULL)
hist(grp2, col = rgb(red = 0, green = 0, blue = 1, alpha = 0.5), 
     xlim = c(170, 230), ylim = c(0, 10), add = TRUE)
