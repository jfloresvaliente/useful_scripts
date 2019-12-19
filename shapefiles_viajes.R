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
# 
# 
# 50*11 + 20*2 + 10*3 + 5*1
# 
# 2700 + (613.3/2)

# Calcular el area de las zonas.
# library(sf)
# f <- st_read('C:/Users/jflores/Downloads/departamentos/DEPARTAMENTOS.shp')
# f$area <- st_area(f)/10000 #Take care of units


# tx_ll <- st_transform(f, "+proj=longlat +ellps=WGS84 +datum=WGS84")
# lonlat <- st_coordinates(tx_ll)
# lonlat <- subset(lonlat, lonlat[,5] == 25)
# x11(); plot(lonlat[,1], lonlat[,2], type = 'l')



# # IMAGEN PARTICULAR EN LAS ZONAS DE UN SHAPEFILE
# library(maptools)
# library(rgdal)
# library(sp)
# library(emojifont)
# library(sf)
# library(raster)
# library(rgeos)
# 
# nc1 <- rgdal::readOGR(system.file("shapes/sids.shp", package = "maptools")[1])
# 
# # Do a point grid in a specific polygon
# grid.pt <- sp::spsample(nc1[which(nc1$NAME == "Alamance"),], n = 20, type = "regular")
# axis(1); axis(2); box()
# 
# # plot the entire map with restricted limits
# plot(nc1, xlim = c(-79.6, -79.1), ylim = c(35.8, 36.3))
# axis(1); axis(2); box()
# 
# # Highlight the selected polygon
# plot(nc1[which(nc1$NAME == "Alamance"),], border = "red", lwd = 3, add = TRUE)
# axis(1); axis(2); box()
# 
# # Normal points
# points(grid.pt, pch = 20, col = "blue", cex = 1)
# 
# # Add emojifont instead of points
# text(coordinates(grid.pt)[, 1], coordinates(grid.pt)[, 2],
#      labels = emoji('evergreen_tree'), cex = 1.5,
#      col = 'forestgreen', family = 'EmojiOne')
# 
# 
# 
# 
# # Plot with your own image
# library(png)
# # Image downloaded as an example for reproducibility
# iconfile1 <- download.file('http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/256/Status-weather-clouds-icon.png',
#                            destfile = 'icon1.png', mode = 'wb')
# icon1 <- png::readPNG('C:/Users/jflores/Desktop/jorgeBrest.PNG')
# 
# # Depending on the desired size of the image
# offset <- 0.02
# 
# # plot the entire map with restricted limits
# plot(nc1, xlim = c(-79.8, -78.9), ylim = c(35.6, 36.5))
# axis(1); axis(2); box()
# 
# # Plot all images at points locations
# for (i in 1:length(grid.pt)) {
#   graphics::rasterImage(
#     icon1,
#     coordinates(grid.pt)[i, 1] - offset,
#     coordinates(grid.pt)[i, 2] - offset,
#     coordinates(grid.pt)[i, 1] + offset,
#     coordinates(grid.pt)[i, 2] + offset
#   )
# }
# 
# getSpPPolygonsLabptSlots(nc1) # sp package
# gCentroid(grid.pt)
