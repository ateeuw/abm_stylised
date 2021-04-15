# distance to plots

# distance to plots data 
distdata <- "C:/Users/TeeuwenAS/OneDrive - Universiteit Twente/Twente/Thesis shared - ABM value chains food security/Data/Paper1/Teff Value Chain in Ethiopia Producer Household Survey//005_SectionC_LandSizesAcquisitionandTenure.dta"

#load libraries
library(readstata13) #needed to read .dta (stata) files
library(ggplot2)
library(dplyr)
library(bbmle)
library(scales)
library(ggpubr)
library(cowplot)

# load data
data5 <- read.dta13(distdata, generate.factors=T, nonint.factors = TRUE)
colnames(data5)[which(colnames(data5) == "sectionc4")] <- "walkdist_min"
colnames(data5)[which(colnames(data5) == "sectionc1")] <- "field_nr" 

data5$walkdist_min <- as.numeric(as.character(data5$walkdist_min))
data5$field_nr <- as.numeric(as.character(data5$field_nr))

dist_ag <- aggregate(walkdist_min ~ hhid, data5, mean)
fieldnr_ag <- aggregate(field_nr ~ hhid, data5, max)

hist(data5$walkdist_min, probability = TRUE,
     ylim = c(0,1), 
     #xlim = c(0,40), 
     breaks = 30,
     col = "lightblue",
     main = "Mean distance to field per household (minutes)")

quantile(data5$walkdist_min, probs = seq(0, 1, 0.25))
quantile(data5$walkdist_min, probs = seq(0, 1, 0.2))
quantile(data5$walkdist_min, probs = seq(0, 1, 0.1))

hist(fieldnr_ag$field_nr, probability = TRUE,
     ylim = c(0,1), 
     #xlim = c(0,40), 
     breaks = max(fieldnr_ag$field_nr),
     col = "lightblue",
     main = "Number of fields per household")

quantile(fieldnr_ag$field_nr, probs = seq(0, 1, 0.25))
quantile(fieldnr_ag$field_nr, probs = seq(0, 1, 0.2))
quantile(fieldnr_ag$field_nr, probs = seq(0, 1, 0.1))
