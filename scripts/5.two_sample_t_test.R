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

# ANOVA -------------------------------------------------------------------
tumor_size_df <- data.frame(size = c(3, 4, 5, 6, 4, 5, 6, 7, 7, 8, 9, 10),
                            group = c("A","A","A","A","B","B","B","B","C","C","C","C"))
tumor_size_df

boxplot(tumor_size_df$size~tumor_size_df$group, xlab = "Group", ylab = "Tumor Size")

res_aov <- aov(size ~ group, data = tumor_size_df)
summary(res_aov)

TukeyHSD(res_aov)
