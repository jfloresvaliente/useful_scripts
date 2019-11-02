library(raster)
library(prettymapr)
library(SDMTools)

DEPA <- shapefile('C:/Users/jflores/Downloads/departamentos/DEPARTAMENTOS.shp')
PROV <- shapefile('C:/Users/jflores/Downloads/provincias/PROVINCIAS.shp')
DIST <- shapefile('C:/Users/jflores/Downloads/distritos/DISTRITOS.shp')

#-------- COMIENZO ELEGIR DISTRITOS--------#
idD <- grep(pattern = 'chanchamayo', x = DIST$DISTRITO, ignore.case = T)
DIST$DISTRITO[idD]
idD
idMAP <- c(1562,401,1545,1536,309,1272,721, 663,501,726,382,384)
showdist <- cbind(DIST$DEPARTAMEN, DIST$PROVINCIA, DIST$DISTRITO)
print(showdist[idMAP,])
# FIN DE ELEGIR DISTRITOS--------#

cols <- numeric(length = length(DIST$DISTRITO))
cols[idMAP] <- 2

pdf('C:/Users/jflores/Desktop/peruviajes.pdf', paper = 'a4', width = 7, height = 9)
# win.metafile('C:/Users/jflores/Desktop/peruviajes.wmf')

# plot(DIST, lwd = 0.15, lty = 1, border = 'grey90')
plot(DIST, lwd = 0.10, lty = 1, border = 'grey90', col = cols)
grid(lty = 1, lwd = 0.10)

plot(DIST, lwd = 0.10, lty = 1, border = 'grey90', add = T)
plot(PROV, lwd = 0.20, lty = 1, border = 'blue', add = T)
plot(DEPA, lwd = 0.50, lty = 1, border = 'black'  , add = T)

box(lwd = 2)
addnortharrow()

Scalebar(x = -80, y = -18.75, distance = 5, unit = 'km', scale = 110, t.cex = 1.25)
axis(1, lwd.ticks = 2, lwd = 2, font = 2, cex.axis = 1.5)
axis(2, lwd.ticks = 2, lwd = 2, font = 2, cex.axis = 1.5, las = 2)

# Now add name of the indiviudal regions to the map
text(DEPA, DEPA$DEPARTAMEN, cex=0.35, lwd = 2, col = 'black')

dev.off()




# library(geosphere)
# x <- matrix(data = c(-85, -84, -5, -5), ncol = 2)
# distm(x, fun = distCosine)
