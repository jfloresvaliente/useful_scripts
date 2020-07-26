library(gridExtra)
library(ggplot2)
library(gridExtra)

data("airquality")
head(airquality)

plot1 <- ggplot(data = airquality, mapping = aes(x = Month, y = Temp))+
  geom_point()

plot2 <- ggplot(data = airquality, mapping = aes(x = Month, y = Temp))+
  geom_line()

grid.arrange(plot1, plot2, nrow = 1)

x11();par(mfrow = c(1,2))
plot1;plot2
