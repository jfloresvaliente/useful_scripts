library(raster)
r <- raster(xmn=5, ymn=5, xmx=16, ymx=16, res=1)
r[] <- 0

r[2:7,2:5] <- 100
r[3:5,5:7] <- 100
r[r < 100] = 0
r[r == 100] = 1

plot(r, xlim = c(5,16), ylim = c(5,16))
# abline(h = c(5:16), v = c(5:16), col = 'grey80')

SP <- rasterToPolygons(clump(r==1), dissolve=TRUE)
k <- SP@polygons[[1]]@Polygons[[1]]@coords

polygon(x = k[,1], y = k[,2], col = 'red')

