# farm size

# farm size data 
landdata <- "C:/Users/TeeuwenAS/OneDrive - Universiteit Twente/Twente/Thesis shared - ABM value chains food security/Data/Paper1/Teff Value Chain in Ethiopia Producer Household Survey/003_SectionB_LandOwnershipandCultivationTypeofParcels.dta"

#load libraries
library(readstata13) #needed to read .dta (stata) files
library(ggplot2)
library(dplyr)
library(bbmle)
library(scales)
library(ggpubr)
library(cowplot)

# load data
data3 <- read.dta13(landdata, generate.factors=T, nonint.factors = TRUE)
colnames(data3)[6] <- "landsize_ha"
data3$landsize_ha <- as.numeric(as.character(data3$landsize_ha))
landsize_ag <- aggregate(landsize_ha ~ hhid, data3, sum)
hist(landsize_ag$landsize_ha, probability = TRUE,
     ylim = c(0,1), xlim = c(0,40), breaks = 30,
     col = "lightblue",
     main = "Land ownership per household (ha)")

quantile(landsize_ag$landsize_ha, probs = seq(0, 1, 0.25))
quantile(landsize_ag$landsize_ha, probs = seq(0, 1, 0.2))
quantile(landsize_ag$landsize_ha, probs = seq(0, 1, 0.1))
