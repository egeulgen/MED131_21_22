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
# define percent benefit
perc_change <- (aids_df$cd4_2 - aids_df$cd4_1) / aids_df$cd4_1 * 100
aids_df$perc_benefit <- perc_change / (aids_df$week_2 - aids_df$week_1)

# subset for trt1
trt1_df <- subset(aids_df, treatment == "trt1")

summary(trt1_df)
hist(trt1_df$perc_benefit)

?t.test
# is the percent benefit for trt1 different than 0? (alpha = 0.05, conf. level = 95%)
t.test(trt1_df$perc_benefit)

# is the percent benefit for trt1 different than 0? (alpha = 0.1, conf. level = 90%)
t.test(trt1_df$perc_benefit, conf.level = 0.9)

# is the percent benefit for trt1 different than 0? (alpha = 0.01, conf. level = 99%)
t.test(trt1_df$perc_benefit, conf.level = 0.99)


# is the percent benefit for trt1 different than -1? (alpha = 0.05)
t.test(trt1_df$perc_benefit, mu = -1)


# is the percent benefit for trt1 larger than 1?
t.test(trt1_df$perc_benefit, mu = 1, alternative = "greater")


# is the percent benefit for trt1 smaller than 1?
t.test(trt1_df$perc_benefit, mu = 1, alternative = "less")
