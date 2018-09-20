library(maps)  
library(mapdata)
library(ggplot2)

coast_map <- fortify(map("worldHires", fill=TRUE, plot=FALSE))

gg <- ggplot()
gg <- gg + geom_map(data=coast_map, map=coast_map,
                    aes(x=long, y=lat, map_id=region),
                    fill="white", color="black")
gg <- gg + geom_map(data=data.frame(region="Peru"), map=coast_map,
                    aes(map_id=region), fill="steelblue")
gg <- gg + xlim(-90,-70) + ylim(-20,-2)
gg <- gg + coord_map()
gg <- gg + theme_bw()
gg