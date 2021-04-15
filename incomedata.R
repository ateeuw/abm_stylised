# income

# income data
incomedata <- "C:/Users/TeeuwenAS/OneDrive - Universiteit Twente/Twente/Thesis shared - ABM value chains food security/Data/Paper1/Teff Value Chain in Ethiopia Producer Household Survey//031_SectionM_Non-CropIncome.dta"

#load libraries
library(readstata13) #needed to read .dta (stata) files
library(ggplot2)
library(dplyr)
library(bbmle)
library(scales)
library(ggpubr)
library(cowplot)

# load data
data31 <- read.dta13(incomedata, generate.factors=T, nonint.factors = TRUE)
colnames(data31) <- c("hhid", "source", "relevant", "amount")

data31$amount <- as.numeric(as.character(data31$amount))

income_ag <- aggregate(amount ~ hhid, data31, sum)

hist(income_ag$amount, 
     #probability = TRUE,
     #ylim = c(0,1), 
     xlim = c(0,550000), 
     #breaks = 30,
     col = "lightblue",
     main = "total household income (birr)")

quantile(income_ag$amount, probs = seq(0, 1, 0.25))
quantile(income_ag$amount, probs = seq(0, 1, 0.2))
quantile(income_ag$amount, probs = seq(0, 1, 0.1))

