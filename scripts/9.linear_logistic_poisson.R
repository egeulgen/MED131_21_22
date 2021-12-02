##################################################
## Project: Undergraduate Biostatistics 
## Script purpose: R practice
## Author: Ege Ulgen
##################################################


# Linear regression -------------------------------------------------------

# We'll use the prostate cancer dataset for this exercise. The main aim of 
# collecting this data set was to inspect the associations between 
# prostate-specific antigen (PSA) and prognostic clinical measurements in men 
# with advanced prostate cancer. Data were collected on 97 men who were about 
# to undergo radical prostectomies.

prca_df <- read.csv("data/prostate_cancer.csv")

dim(prca_df)
head(prca_df)

# fix factor variables
prca_df$invasion <- as.factor(prca_df$invasion)
prca_df$Gleason <- as.factor(prca_df$Gleason)

# summary for all variables
summary(prca_df)

# check normality
hist(prca_df$PSA)
qqnorm(prca_df$PSA)
qqline(prca_df$PSA)

prca_df$logPSA <- log(prca_df$PSA)
hist(prca_df$logPSA)
qqnorm(prca_df$logPSA)
qqline(prca_df$logPSA)

fit1 <- lm(logPSA~vol, data = prca_df)
summary(fit1)

# to make sense of the intercept
fit1_1 <- lm(logPSA~I(vol - min(vol)), data = prca_df)
summary(fit1_1)

fit2 <- lm(logPSA~vol + invasion, data = prca_df)
summary(fit2)

fit3 <- lm(logPSA~vol * invasion, data = prca_df)
summary(fit3)

fit4 <- lm(logPSA~vol + Gleason, data = prca_df)
summary(fit4)

prca_df$Gleason <- relevel(prca_df$Gleason, "7")
fit4_2 <- lm(logPSA~vol + Gleason, data = prca_df)
summary(fit4_2)
prca_df$Gleason <- relevel(prca_df$Gleason, "6")

final_fit <- lm(logPSA~I(vol - min(vol)) + invasion + Gleason, data = prca_df)
summary(final_fit)

# Logistic regression -----------------------------------------------------

# The data we'll use is `birthwt` from the `MASS` package. The `birthwt` data 
# frame has 189 rows and 10 columns. The data were collected at Baystate 
# Medical Center, Springfield, Mass during 1986.

# install.packages("MASS")
library(MASS)

data(birthwt) 
?birthwt

dim(birthwt)

head(birthwt)

# turn categorical variables into factor
birthwt$low <- as.factor(birthwt$low)
birthwt$race <- as.factor(birthwt$race)
birthwt$smoke <- as.factor(birthwt$smoke)
birthwt$ht <- as.factor(birthwt$ht)
birthwt$ui <- as.factor(birthwt$ui)

summary(birthwt)

# We'll be using logistic regression to identify risk factors associated with low infant birth weight (birth weight less than 2.5 kg).
fit5 <- glm(low~. - bwt, data = birthwt, family = binomial)
summary(fit5)

fit6 <- glm(low~lwt + race + smoke + ht, data = birthwt, family = binomial)
summary(fit6)

(exp(-0.0179) - 1) * 100

# Poisson Regression ------------------------------------------------------
library(HSAUR)

data("epilepsy")

head(epilepsy, 10)
summary(epilepsy)

## subset for the first period
epilepsy_1_df <- epilepsy[epilepsy$period == 1, ]

head(epilepsy_1_df, 10)
summary(epilepsy_1_df)

# visually compare number of seizures at baseline and at 2 weeks
par(mfrow = c(2, 1))
hist(epilepsy_1_df$base, main = "Number of seizure at baseline")
hist(epilepsy_1_df$seizure.rate, main = "Number of seizure at 2-weeks")
par(mfrow = c(1, 1))

# compare bw/ treatment groups
boxplot(epilepsy_1_df$seizure.rate~epilepsy_1_df$treatment)

# correlation with age?
plot(epilepsy_1_df$seizure.rate~epilepsy_1_df$age)
cor(epilepsy_1_df$seizure.rate,epilepsy_1_df$age, method = "spearman")



min(epilepsy_1_df$base)
min(epilepsy_1_df$age)

pos_reg <- glm(seizure.rate ~ as.factor(treatment) + I(base - 6) + I(age - 18),
               data = epilepsy_1_df, family = poisson)
summary(pos_reg)

## A patient in placebo group, with 6 previous seizure, and aged 18 had 
# approximately 2 seizures on average in the first two weeks after the trial was started
exp(0.750838)

## With 95% confidence, it could be said that there was no difference between 
# placebo and progabide (p-value = 0.2). Negative estimate for β1 indicates 
# lowered mean number of seizures for progabide, but the difference from placebo 
# was not significant.

## With 95% confidence, it could be said that previous number of seizures occurred 
# in the 8-week interval prior to the study start and mean seizure rate was 
# significantly associated (p-value < 2 × 10−16). One unit increase in previous 
# seizure is associated with approximately 2.6% increase in the mean number of 
# seizures in the first two weeks of the trial.
(exp(0.025736) - 1) * 100

## With 95% confidence, it could be said that age and mean number of seizures 
# was significantly associated (p-value = 2.66 × 10−9). One year increase in age 
# was associated with approximately 4.8% increase in the seizure rate in the 
# first two weeks of the trial.
(exp(0.046528) - 1) * 100
