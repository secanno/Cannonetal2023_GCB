#install.packages('DHARMa')
#install.packages("glmmTMB", repos="https://glmmTMB.github.io/glmmTMB/repos") #to install development version, needed to run zero-inflated beta regression

library(glmmTMB)
library(DHARMa)


#run model
mod <- glmmTMB(formula = percent ~ NDVI + log(humanpop + 1) + marketgravity + cumul_humanimpact_score + nutrient_percent + 
                       (1|(Latitude:Longitude)), data = data_scaled, zi = ~., family = beta_family)

summary(mod)

#test assumptions with DHARMa
simres <- simulateResiduals(mod)
plot(simres) #both QQ plot and residuals
plotQQunif(simres) #plot QQplot only
plotResiduals(simres) #plot residuals only



#moran's test for spatial autocorrelation
#install.packages('spdep')
library(spdep)

#create data frame with lat and long values
points <- data.frame('Longitude' = as.numeric(data$Longitude),
                     'Latitude' = as.numeric(data$Latitude))

#convert to spatial object
spdf <- SpatialPointsDataFrame(coords = points, data = data, 
                               proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

#define neighborhood continuity by distance
knn <- knearneigh(spdf, longlat = TRUE)

#define neighbors list
nb <- knn2nb(knn)

#add spatial weights
nbw <- nb2listw(nb, style = "W")

#test for spatial autocorrelation with residuals
mtest <- moran.test(simres, nbw)
mtest #print results
