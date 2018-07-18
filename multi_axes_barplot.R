# win.metafile("mygraph.emf", 12, 8, res=120)
#tiff(filename = "Rplot%03d.tif", width = 1450, height = 780, res=140)
time<-seq(7000,3400,-200)
pop<-c(200,400,450,500,300,100,400,700,830,1200,400,350,200,700,370,800,200,100,120)
grp<-c(2,5,8,3,2,2,4,7,9,4,4,2,2,7,5,12,5,4,4)
med<-c(1.2,1.3,1.2,0.9,2.1,1.4,2.9,3.4,2.1,1.1,1.2,1.5,1.2,0.9,0.5,3.3,2.2,1.1,1.2)
# x11()
par(mar=c(5, 12, 4, 4) + 0.1 , oma = c(0.1, 0, 0.1, 0))

graf = barplot(pop, axes=F, ylim=c(0,max(pop)), xlab="", ylab="",col="grey",
               main="",names.arg = pop)
legend(x = 0 , y = 1100, legend = "Population", fill = "grey",box.lty=0,
       bty = "n", cex=0.7, x.intersp=0.2)
legend(x = 0 , y = 1050,legend=c("Median Group Size","Number of Groups"),
       lty=c(2,3), cex=0.7, box.lty=0, bty = "n", col=c("red","blue"),x.intersp=0.2)
axis(2, ylim=c(0,max(pop)),col="black",lwd=2)
mtext(2,text="Population",line=2)

par(new=T)
plot(graf, med, axes=F, ylim=c(0,max(med)), xlab="", ylab="", 
     type="l",lty=2, main="",lwd=2 , xlim=c(0,23), col="red", yaxs="i")
axis(2, ylim=c(0,max(med)),lwd=2,line=3.5, col="red",  col.axis = 'red')
points(graf, med,pch=20, col="red")
mtext(2,text="Median Group Size",line=5.5, col="red")#, col.ticks="red")


par(new=T)
plot(graf, grp, axes=F, ylim=c(0,max(grp)), xlab="", ylab="", 
     type="l",lty=3, main="",lwd=2 , xlim=c(0,23), col="blue",yaxs="i")
axis(2, ylim=c(0,max(grp)),lwd=2,line=7, col="blue",col.axis = 'blue')
points(graf, grp,pch=15, col="blue")
mtext(2,text="Number of Groups",line=9, col="blue")

axis(1,pretty(range(time),10))
mtext("cal BP",side=1,col="black",line=2)


# dev.off()
