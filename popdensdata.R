# Population data

# url to site where I downloaded data:https://data.humdata.org/dataset/ethiopia-high-resolution-population-density-maps-demographic-estimates

library(raster)

wdir <- "C:/Users/TeeuwenAS/OneDrive - Universiteit Twente/Twente/Thesis shared - ABM value chains food security/Stylized model - clean/inputmaps"
file <- list.files(wdir)[1]

popdens <- raster(paste(wdir, "/", file, sep = ""))
plot(popdens, col = rainbow(15)[5:15], colNA = "grey")
res(popdens)

hist(popdens)

#average population density in kersa (jimma)
popdens <- 365.1 #https://en.wikipedia.org/wiki/Kersa,_Hararge#:~:text=With%20an%20estimated%20area%20of,the%20Zone%20average%20of%20102.6.
cell_factor <- (250^2)/(1000^2)
popdens_cell <- 365.1*cell_factor
