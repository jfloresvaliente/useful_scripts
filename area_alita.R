# library(pracma)
dat <- read.table('C:/Users/jflores/Documents/JORGE/ECOGRANJA_WALLPAKUNA/terreno/Alita.csv', header = F, sep = ';')
plot(dat[,2], dat[,1], type = 'l')

# for(i in 1:dim(dat)[1]){
#   points(dat[i,2], dat[i,1], col = 'red')
#   print(i)
#   Sys.sleep(time = 1)
# }

# library(geosphere)
# lon <- c(-81, -80, -80,-81)
# lat <- c(-5, -5, -6, -6)
# d <- cbind(lon, lat)
# geosphere::areaPolygon(d)/10^6


library(proj4)
proj4string <- "+proj=utm +zone=19 +south +ellps=WGS84 +datum=WGS84 +units=m +no_defs "

# Source data
xy <- dat; colnames(xy) <- c('x','y')
# xy <- data.frame(x=354521, y=7997417.8)

# Transformed data
pj <- project(xy, proj4string, inverse=TRUE)
lonlat <- data.frame(lon=pj$x, lat=pj$y)
print(lonlat)
geosphere::areaPolygon(lonlat)/10000

png(filename = 'C:/Users/jflores/Documents/JORGE/ECOGRANJA_WALLPAKUNA/terreno/Alita.png', height = 850, width = 850, res = 120)
plot(lonlat[,1], lonlat[,2], type = 'l', axes = F, xlab = '', ylab = '')
grid()
box()
mtext(text = 'Colegio', side = 1, adj = .85, line = -2)
dev.off()

for(i in 1:dim(lonlat)[1]){
  points(lonlat[i,1], lonlat[i,2], col = 'red')
  print(i)
  Sys.sleep(time = 1)
}

