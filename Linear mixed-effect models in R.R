# Linear mixed-effect models in R

# Install (if necessary) and load nlme and lme4
library(nlme)
library(lme4)
# Load dataset, inspect size and additional info
data(Arabidopsis)
dim(Arabidopsis) # 625 observations, 8 variables
?Arabidopsis
attach(Arabidopsis)

# Overview of the variables
par(mfrow = c(2,4))
barplot(table(reg), ylab = "Frequency", main = "Region")
barplot(table(popu), ylab = "Frequency", main = "Population")
barplot(table(gen), ylab = "Frequency", las = 2, main = "Genotype")
barplot(table(rack), ylab = "Frequency", main = "Rack")
barplot(table(nutrient), ylab = "Frequency", main = "Nutrient")
barplot(table(amd), ylab = "Frequency", main = "AMD")
barplot(table(status), ylab = "Frequency", main = "Status")
hist(total.fruits, col = "grey", main = "Total fruits", xlab = NULL)


# Transform the three factor variables gen, rack and nutrient
Arabidopsis[,c("gen","rack","nutrient")] <- lapply(Arabidopsis[,c("gen","rack","nutrient")], factor)
str(Arabidopsis)
# Re-attach after correction, ignore warnings
attach(Arabidopsis)
# Add 1 to total fruits, otherwise log of 0 will prompt error
total.fruits <- log(1 + total.fruits)

# gen x popu table
table(gen, popu)
# Any NAs?
any(is.na(Arabidopsis)) # FALSE


LM <- lm(total.fruits ~ rack + nutrient + amd + status)
summary(LM)
par(mfrow = c(2,2))
plot(LM)

GLM <- gls(total.fruits ~ rack + nutrient + amd + status,
           method = "ML")
summary(GLM)



lmm1 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|reg, method = "ML")
lmm2 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|popu, method = "ML")
lmm3 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|gen, method = "ML")
lmm4 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|reg/popu, method = "ML")
lmm5 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|reg/gen, method = "ML")
lmm6 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|popu/gen, method = "ML")
lmm7 <- lme(total.fruits ~ rack + nutrient + amd + status,
            random = ~1|reg/popu/gen, method = "ML")
anova(GLM, lmm1, lmm2, lmm3, lmm4, lmm5, lmm6, lmm7)



# Set optimization pars
ctrl <- lmeControl(opt="optim")
lmm6.2 <- update(lmm6, .~., random = ~nutrient|popu/gen, control = ctrl)
lmm7.2 <- update(lmm7, .~., random = ~nutrient|reg/popu/gen, control = ctrl)
anova(lmm6, lmm6.2, lmm7, lmm7.2) # both models improved
anova(lmm6.2, lmm7.2) # similar fit; lmm6.2 more parsimonious
summary(lmm6.2)


plot(ranef(lmm6.2, level = 2))


# QQ plots (drawn to the same scale!)
par(mfrow = c(1,2))
lims <- c(-3.5,3.5)
qqnorm(resid(GLM, type = "normalized"),
       xlim = lims, ylim = lims,main = "GLM")
abline(0,1, col = "red", lty = 2)
qqnorm(resid(lmm6.2, type = "normalized"),
       xlim = lims, ylim = lims, main = "lmm6.2")
abline(0,1, col = "red", lty = 2)
