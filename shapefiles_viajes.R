library(raster)

v1 <- shapefile('C:/Users/jflores/Downloads/departamentos/DEPARTAMENTOS.shp')
# Each region should have different color; we will use the color ramp
n <- length(v1$DEPARTAMEN)
DEPindex <- c(12,14,19)

v1$DEPARTAMEN
cols <- rep(0, times = n)
cols[DEPindex] <- 2

plot(v1, col=cols, main = 'Perú: La Pichotita y el Ñato')
# Now add name of the indiviudal regions to the map
text(v1, v1$DEPARTAMEN, cex=0.5, lwd = 2)


