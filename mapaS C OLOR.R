# install.packages("raster")
# install.packages("maps")
# install.packages("mapdata")

Lat.lim=c(-40,-5)
Long.lim=c(-90,-69)
Site.Longs=c(-27)
Site.Lats=c(-90)
library(mapdata)
Site.Names=c("Souris","Tignish","Summerside")
map("worldHires", xlim=Long.lim, ylim=Lat.lim, col="grey", fill=TRUE, resolution=0);map.axes();
#map.scale(ratio=TRUE) # do you want a scale?

points(Libro3$longitud,Libro3$latitude,pch=16, col="red") #Add points if you have data in Site.Longs and Site.lats
points(-110,-27, pch = 8 ) # this will add point a single point (*) to the Maggies 
text(Site.Longs,Site.Lats,labels=Site.Names,pos=4, offset=0.3) # add labels
text(-61.6,47.7,labels="Ilse de Madeleine",pos=4, offset=0.3) # add label to an individual plot

# install.packages("marmap")
library(marmap)
blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))
pacif<- getNOAA.bathy(-80,-70,-20,-10,resolution=10)
plot.bathy(pacif,
           image = TRUE,
           land = TRUE,
           n=3,
           drawlabels=TRUE,
           lwd=1, lty=1, col="black", default.col="white",
           bpal = list(c(0, max(pacif), greys(100)),
                       c(min(pacif), 0, blues(100))))

points(mapa$Long,mapa$Lat,pch=16, col="red") 
scaleBathy(pacif, deg = 0.5)
# install.packages("lattice")
library(lattice)
wireframe(unclass(pacif), drape = TRUE,
          aspect = c(1, 0.1),
          scales = list(draw=F,arrows=F),
          xlab="",ylab="",zlab="",
          at=c(min(pacif)/100*(99:0),max(pacif)/100*(1:99)),
          col.regions = c(blues(100),greys(100)),
          col='transparent')


library(marmap)
blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))
pacif<- getNOAA.bathy(-80,-70,-20,-10,resolution=10)
plot.bathy(pacif,
           image = TRUE,
           land = TRUE,
           n=6,
           drawlabels=TRUE,
           lwd=1, lty=1.7, col="black", default.col="white",
           bpal = list(c(0, max(pacif), greys(100)),
                       c(min(pacif), 0, blues(100))))
scaleBathy(pacif, deg = 0.5)
points(mapa$Long,mapa$Lat,pch=16, col="yellow",cex=1.5) 

###########

library(marmap)
blues <- colorRampPalette(c("darkblue", "cyan"))
greys <- colorRampPalette(c(grey(0.4),grey(0.99)))
pacif<- getNOAA.bathy(-80,-70,-20,-10,resolution=10)
plot.bathy(pacif,
           image = TRUE,
           land = TRUE,
           n=3,
           drawlabels=TRUE,
           lwd=1, lty=1, col="black", default.col="white",
           bpal = list(c(0, max(pacif), greys(100)),
                       c(min(pacif), 0, blues(100))))
scaleBathy(pacif, deg = 0.5)
points(mapa$Long,mapa$Lat,pch=16, col="yellow",cex=1.3) 



