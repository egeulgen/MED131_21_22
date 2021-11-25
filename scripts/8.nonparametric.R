##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: R practice
## Author: Ege Ulgen
##################################################

# Assessment of normality -------------------------------------------------
aids_df <- read.delim("data/aids_dataset.txt", sep = " ")

### inspect the distribution of age and CD4 at week 1
hist(aids_df$age, xlab = "Age", main = "Normal Distribution")
hist(aids_df$cd4_1, xlab = "CD4 count at week 1", main = "Positively Skewed Distribution")

qqnorm(aids_df$age, main = "Normal Distribution")
qqline(aids_df$age)

qqnorm(aids_df$cd4_1, main = "Positively Skewed Distribution")
qqline(aids_df$cd4_1)

shapiro.test(aids_df$cd4_1)
shapiro.test(aids_df$age)


### "normalize" CD4 at week 1
hist(log(aids_df$cd4_1), xlab = "CD4 count at week 1")

# Non-parametric tests ----------------------------------------------------

# is the CD4 at week 1 different between genders?
boxplot(aids_df$cd4_1~aids_df$gender)
wilcox.test(aids_df$cd4_1~aids_df$gender)

# is the CD4 at week 2 different between treatment groups?
boxplot(aids_df$cd4_2~aids_df$treatment)
kruskal.test(aids_df$cd4_2~aids_df$treatment)

pairwise.wilcox.test(aids_df$cd4_2, aids_df$treatment)
