#===============================================================================
# Name   : multi_axes
# Author : Jorge Flores
# Date   : 
# Version:
# Aim    : Make a plot(lines) with 'Y' multi-axes
# URL    : 
#===============================================================================

#------------------------ VARIABLES ------------------------#
time <- seq(7000,3400,-200)
pop  <- c(200,400,450,500,300,100,400,700,830,1200,400,350,200,700,370,800,200,100,120)
grp  <- c(2,5,8,3,2,2,4,7,9,4,4,2,2,7,5,12,5,4,4)
med  <- c(1.2,1.3,1.2,0.9,2.1,1.4,2.9,3.4,2.1,1.1,1.2,1.5,1.2,0.9,0.5,3.3,2.2,1.1,1.2)

#------------------------ PLOTS ------------------------#
# x11()
par(mar=c(5, 12, 4, 4) + 0.1) # Graphical parameters of the plot

# Base plot where the remaining 'Y' axes will be added (first 'Y' axis)
graf <- plot(x = time, y = pop, ylim = c(0,max(pop)), xlim = c(7000,3400),
             axes = F, xlab = '', ylab = '',type = 'l',
             col='black', main='',yaxs='i')
points(time, pop, pch = 15, col = 'black')
axis(2, ylim = c(0,max(pop)), col = 'black', lwd = 2)
mtext(2, text = 'Population', line = 2)
box(lwd = 2)

# Add second 'Y' axis
par(new = T)
plot(time, med, axes = F, ylim = c(0,max(med)), xlim = c(7000,3400),
     xlab = '', ylab = '', type = 'l',lty = 2, main = '',lwd = 2, yaxs = 'i')
axis(2, ylim = c(0,max(med)), lwd = 2,line = 3.5)
points(time, med, pch = 20)
mtext(2, text = 'Median Group Size', line = 5.5)

# Add third 'Y' axis
par(new=T)
plot(time, grp, axes = F, ylim = c(0,max(grp)), xlab = '', ylab = '', 
     type = 'l', lty = 3, main = '', xlim = c(7000,3400), lwd = 2, yaxs = 'i')
axis(2, ylim = c(0,max(grp)),lwd = 2,line = 7)
points(time, grp, pch = 20)
mtext(2, text = 'Number of Groups', line = 9)

# Add 'X' axis
axis(1, pretty(range(time),10))
mtext('cal BP',side=1,col='black',line=2)

# Add legend
legend('topleft', legend = c('Population','Median Group Size','Number of Groups'),
       lty = c(1,2,3), cex = 0.95, box.lty = 0, bty = 'n')

#===============================================================================
# END OF PROGRAM
#===============================================================================
