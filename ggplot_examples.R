#=============================================================================#
# Name   : ggplot_examples
# Author : Jorge Flores
# Date   : 
# Version:
# Aim    : Some useful examples of using ggplot
# URL    : 
#=============================================================================#

library(ggplot2)
library(gridExtra)

#--------- GGPLOT layout: grid.arrange() ---------#
data('airquality')
head(airquality)

plot1 <- ggplot(data = airquality, mapping = aes(x = Day, y = Temp))+
  geom_point()

plot2 <- ggplot(data = airquality, mapping = aes(x = Day, y = Temp))+
  geom_line()

grid.arrange(plot1, plot2, nrow = 1)

#--------- GGPLOT layout: facet_wrap() ---------#
plot3 <- ggplot(data = airquality, mapping = aes(x = Day, y = Temp))+
  geom_point()+
  facet_wrap(~Month)
plot3

#=============================================================================#
# END OF PROGRAM
#=============================================================================#