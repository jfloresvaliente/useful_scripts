library(maps)  
library(mapdata)
library(ggplot2)

coast_map <- fortify(map("worldHires", fill=TRUE, plot=FALSE))

gg <- ggplot()
gg <- gg + geom_map(data=coast_map, map=coast_map,
                    aes(x=long, y=lat, map_id=region),
                    fill="white", color="black")
gg <- gg + geom_map(data=data.frame(region="Peru"), map=coast_map,
                    aes(map_id=region), fill="grey60")
gg <- gg + xlim(-90,-70) + ylim(-20,-2)
gg <- gg + coord_map()
gg <- gg + theme_bw()
gg


# Segunda forma
library(maps)  
library(mapdata)

peru <- map("worldHires", regions="Peru", plot=FALSE, fill=TRUE)

x11()
map("worldHires", xlim=c(-90,-70), ylim=c(-20,0))
map(peru, col="grey60", fill=TRUE, add=TRUE)
box(lwd = 3)
