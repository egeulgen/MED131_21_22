##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: R practice
## Author: Ege Ulgen
##################################################

# install necessary package -----------------------------------------------
install.packages("datarium")


# load and inspect data ---------------------------------------------------
data("genderweight", package = "datarium")

head(genderweight)

# frequency table of gender(group)
table(genderweight$group)

# histogram of weight (overall)
hist(genderweight$weight)

# boxplot of weight (overall)
boxplot(genderweight$weight)

# boxplot of weight by gender
boxplot(genderweight$weight~genderweight$group)

# mean weight of men
mean(genderweight$weight[genderweight$group == "M"])

# mean weight of women
mean(genderweight$weight[genderweight$group == "F"])

# sd of weight of men
sd(genderweight$weight[genderweight$group == "M"])

# sd of weight of women
sd(genderweight$weight[genderweight$group == "F"])

## is the mean weight of men significantly different than the mean weight of women?
t.test(genderweight$weight~genderweight$group)
t.test(weight~group, data = genderweight)
