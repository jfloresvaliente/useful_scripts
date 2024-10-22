#=============================================================================#
# Name   : CalculationDistance2Coast
# Author : Jorge Flores-Valiente
# Date   : 
# Version:
# Aim    : 
# URL    : 
#=============================================================================#
library(geosphere)
library(maps)
library(mapdata)

Peru <- map('world', regions = 'Peru', col = 'grey90', fill=TRUE, xlim=c(-90,-70), ylim=c(-20,-2), plot = F)
line <- cbind(Peru$x, Peru$y)
pnts <- matrix(data = c(-83, -15, -83, -10, -83, -5), ncol = 2, byrow = T)

d = dist2Line(pnts, line)

# png('C:/Users/jflores/Desktop/DCcalculation.png', width = 850, height = 850, res = 120)
par(lwd = 2)
map('worldHires', col = 'grey90', fill=TRUE, xlim=c(-90,-70), ylim=c(-20,-2), lwd = 1)
axis(1, font = 2)
axis(2, font = 2, las = 2)
box()
mtext(side = 1, line = 2.5, font = 2, text = 'Longitude')
mtext(side = 2, line = 2.5, font = 2, text = 'Latitude')
points(pnts, col='blue', pch=20)
points(d[,2], d[,3], col='red', pch='X')

for(i in 1:nrow(d)){
  lines(gcIntermediate(pnts[i,], d[i,2:3], 20), lwd=1) 
}
# dev.off()
#=============================================================================#
# END OF PROGRAM
#=============================================================================#