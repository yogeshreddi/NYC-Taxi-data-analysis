#######Evaluating the distance based on lat/longs 
install.packages('geosphere')
library(geosphere)

data = read.csv('export.csv')
dist = c()
for (i in 1:nrow(data)){
  dist = c(dist, distm(c(data$P_LONG[i],data$P_LAT[i]), c(data$D_LONG[i],data$D_LAT[i]), fun = distHaversine))
}

data$TRIP_DISTANCE_IN_METERS<-dist
data$TRIP_DISTANCE_IN_MILES<-dist/1609.34

write.csv(data,"new_data.csv")