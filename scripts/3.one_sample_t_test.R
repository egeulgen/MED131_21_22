##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: R practice
## Author: Ege Ulgen
##################################################

# read data ---------------------------------------------------------------
aids_df <- read.delim("https://raw.githubusercontent.com/egeulgen/MED131_21_22/main/data/aids_dataset.txt", sep = " ")

# print first 6 rows (default)
head(aids_df)

# how many patients are there in each treatment group?
table(aids_df$treatment)

# summary of all variables
summary(aids_df)

# one-sample t-test -------------------------------------------------------
# subset for trt1
trt1_df <- subset(aids_df, treatment == "trt1")

summary(trt1_df$cd4_2)
hist(trt1_df$cd4_2)

?t.test
# is the CD4 level at week 2 for trt1 different than 0?
t.test(trt1_df$cd4_2)

# is the CD4 level at week 2 for trt1 different than 20?
t.test(trt1_df$cd4_2, mu = 20)

# is the CD4 level at week 2 for trt1 different than 25?
t.test(trt1_df$cd4_2, mu = 25)


# is the CD4 level at week 2 for trt1 different than 20? (alpha = 0.1, conf. level = 90%)
t.test(trt1_df$cd4_2, mu = 20, conf.level = 0.9)

# is the CD4 level at week 2 for trt1 different than 20? (alpha = 0.01, conf. level = 99%)
t.test(trt1_df$cd4_2, mu = 20, conf.level = 0.99)


# is the CD4 level at week 2 for trt1 larger than 25?
t.test(trt1_df$cd4_2, mu = 25, alternative = "greater")

# is the CD4 level at week 2 for trt1 smaller than 25?
t.test(trt1_df$cd4_2, mu = 25, alternative = "less")
