#=============================================================================#
# Name   : barplot_lines_start_in_0
# Author : Jorge Flores
# Date   :
# Version:
# Aim    : Barplot and lines adjusting the 'X' axis to zero
# URL    :
#=============================================================================#

# Don't change anything after here, unless you know what you're doing

#------------------------ DATA ------------------------#
var1 <- c(0, 2.82493852, -0.02076835, 0.83912966, NA, 0.05669618, 0.02861925, 0, -0.00042158)
var2 <- c(7.64, 7.35, 7.61, 7.56, NA, 7.80, 8.01, 7.90, 7.83)
var3 <- c(124.991823, 2.892884, 36.625901, 37.786817, 0, 45.411959, 63.950239, 83.151453, 33.148390)

var4 <- c(0.54516805, 0.62119610, -0.20161996, -0.36348088, NA, 0.50766168, -0.27168943, -0.22786131, -0.01433372)
var5 <- c(7.56, 7.61, 7.64, 7.63, NA, 7.74, 7.75, 7.80, 7.99)
var6 <- c(2.437640, 3.506266, 2.853195, 2.384335, 0, 25.314684, 13.031470, 38.002073, 102.542321) 

var7 <- c(0.23627238, 2.66926883, 1.54251206, 4.25840338, NA, -0.22304255, 0.14335418, 0.02771696, 0.81652486)
var8 <- c(7.67, 7.57, 7.64, 7.68, NA, 7.89, 7.80, 7.79, 8.05)
var9 <- c(39.267284, 2.040037, 1.993319, 2.022820, 0, 79.523003, 37.067710, 27.111731, 159.389316)



## ## Graph (blank) basis to obtain the coordinates that were used for the rest of the plots ## ##
bar <- barplot(1:length(var1), plot=F) # para extraer coordenadas

#------------------------ PLOT ------------------------#

pngfile <- paste0('barplot_lines_start_in_0.png')
png(pngfile,width=2.5,height = 3.7,units = 'in',res=400,pointsize = 6)

#--------- Start  Layout of figure: Distribution and margins ---------#
m <- matrix(c(1,1,2,2,3,3,4,4),nrow=4,ncol=2,byrow=T)
m <- layout(mat=m,heights = c(0.3,0.3,0.3,0.1))
par(oma=c(0.1,4,2,8),mar=c(4,4,1,4))
#--------- End of Layout of figure: Distribution and margins ---------#

#----------- ----------- -----------plot1 ----------- ----------- -----------#
graf <- barplot(var1, axes=T, ylim=c(-1,5), col='lightcoral',xlim = c(0,round(max(bar),0)))
abline(h=0,col='black')
title (main ='Station E1', line = -0)

#----- line 1 -----#
par(new=T)
plot(bar, var2, axes=F, ylim=c(6.75,8.5), xlab='', ylab='', type='c', main='',lwd=1 , xlim = c(0,round(max(bar),0)), col='black')
axis(4, ylim=c(0,8.5),lwd=1,line=5.5)
points(bar, var2,pch=0,cex=1)
mtext(4,text='Potential of Hydrogen (pH)',line=7.5, cex=0.6)

#----- line 2 -----#
par(new=T)
plot(bar, var3, axes=F, ylim=c(-25,160), xlab='', ylab='', type='c',lwd=1 ,xlim = c(0,round(max(bar),0)), col='black')
axis(4,lwd=1,line=1.5, col='black',col.axis='black')
points(bar, var3,pch=16,cex=1,col='black')
mtext(4,text=expression(Oxygen~paste('(',?mol,.L,')')),line=3.8, cex=0.7)

#----------- ----------- -----------plot2 ----------- ----------- -----------#
graf <- barplot(var4, axes=T, ylim=c(-1,5), col='lightcoral',xlim = c(0,round(max(bar),0)))
abline(h=0,col='black')
title (main ='Station E2', line = -0)
mtext(2,line=3, cex=0.85, text=expression(Hydrogen~sulfide~fluxes~paste('(',mmol.m^2,.d^-1,')')))

#----- line 1 -----#
par(new=T)
plot(bar, var5, axes=F, ylim=c(6.75,8.5), xlab='', ylab='', type='c', main='',lwd=1 , xlim = c(0,round(max(bar),0)), col='black')
axis(4, ylim=c(0,8.5),lwd=1,line=5.5)
points(bar, var5,pch=0,cex=1)
mtext(4,text='Potential of Hydrogen (pH)',line=7.5, cex=0.6)

#----- line 2 -----#
par(new=T)
plot(bar, var6, axes=F, ylim=c(-25,160), xlab='', ylab='', type='c',lwd=1 ,xlim = c(0,round(max(bar),0)), col='black')
axis(4,lwd=1,line=1.5, col='black',col.axis='black')
points(bar, var6,pch=16,cex=1,col='black')
mtext(4,text=expression(Oxygen~paste('(',?mol,.L,')')),line=3.8, cex=0.7)

#----------- ----------- -----------plot3 ----------- ----------- -----------#
graf <- barplot(var7, axes=T, ylim=c(-1,5), col='lightcoral',xlim = c(0,round(max(bar),0)))
abline(h=0,col='black')
title (main ='Station E3', line = -0)

#----- line 1 -----#
par(new=T)
plot(bar, var8, axes=F, ylim=c(6.75,8.5), xlab='', ylab='', type='c', main='',lwd=1 , xlim = c(0,round(max(bar),0)), col='black')
axis(4, ylim=c(0,8.5),lwd=1,line=5.5)
points(bar, var8,pch=0,cex=1)
mtext(4,text='Potential of Hydrogen (pH)',line=7.5, cex=0.6)

#----- line 2 -----#
par(new=T)
plot(bar, var9, axes=F, ylim=c(-25,160), xlab='', ylab='', type='c',lwd=1 ,xlim = c(0,round(max(bar),0)), col='black')
axis(4,lwd=1,line=1.5, col='black',col.axis='black')
points(bar, var9,pch=16,cex=1,col='black')
mtext(4,text=expression(Oxygen~paste('(',?mol,.L,')')),line=3.8, cex=0.7)

#--------- --------- artifice for legend --------- ---------#
par(mai=c(0,0,0,0))
plot.new()
legend(x='center',legend = c('pH','Oxygen'),horiz = T, pch=c(0,16),col=c('black','black'),bty = 'n')
dev.off()
#=============================================================================#
# END OF PROGRAM
#=============================================================================#