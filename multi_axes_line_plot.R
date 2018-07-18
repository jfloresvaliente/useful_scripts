### SCRIPT PARA GENERAR GRÁFICOS CON MULTIAXIS 'Y' ###

getwd() # te dice en que directorio estas trabando
# SI DESEAS GUARDAR LA IMAGEN COMO TIFF DESCOEMTAR LA SGIUIENTE LINEA Y LA ULTIMA ('dev.off'),
# la imagen sera guardada en la direccion que arroja la funcio 'getwd'
# tiff(filename = 'miplot.tif', width = 1450, height = 780, res=140)

# PASO 1 # Crear la serie de tiempo que será el eje 'X'

# crea una serie de tiempo de 12 meses (puedes cambiar el año de inicio), length.out indica longtud de la serie,
# tu decides de acuerdo al numero de años y meses que desees que tenga la serie

time = seq(as.Date('2000/1/1'), by = 'month', length.out = 19) 
time = format(time, '%b-%y') # formato de la fecha (solo aparece Month-Year), así ya tienes el eje 'X'

# PASO 2 # Crear los datos (vectores) que vas a plotear, en tu caso los debes importar y guardarlos como onjetos 

# todos los vectores deben tener la misla longitud que la serie de tiempo 'time'
pop<-c(200,400,450,500,300,100,400,700,830,1200,400,350,200,700,370,800,200,100,120)
grp<-c(2,5,8,3,2,2,4,7,9,4,4,2,2,7,5,12,5,4,4)
med<-c(1.2,1.3,1.2,0.9,2.1,1.4,2.9,3.4,2.1,1.1,1.2,1.5,1.2,0.9,0.5,3.3,2.2,1.1,1.2)

# PASO 3 # Hacer un primer plot y configurar el los parámetros del gráfico

par(mar=c(3, 8, 4, 8) + 0.1 , oma = c(0.1, 0, 0.1, 0)) # parámetros gráficos, no los cambies

# generar primer grafico (1er vector) sin ejes
graf = plot(x=1:length(time),y=pop, type='l',axes=F, ylim=c(0,max(pop)), xlab='', ylab='',col='black',main='')

axis(1, at=1:length(time), labels = time) # colocar eje 'X' por unica vez
axis(side=2, ylim=c(0,max(pop)),col='black',lwd=2) # colocar primer eje 'Y', side = axis place 1=below, 2=left, 3=above and 4=right.
mtext(2,text='Population',line=2) # colocar nombre al eje 'Y'
mtext('time',side=1,col='black',line=2) # colocar nombre al eje 'X'

# PASO 4 # Hacer los siguientes 2 graficos
# generar segundo grafico (1er vector) y agregar su propio eje
par(new=T) # esto abliga a generar el siguiente grafico encima del que ya está creado
plot(x=1:length(time),y= med, axes=F, ylim=c(0,max(med)), xlab='', ylab='', 
     type='l',lty=2, main='',lwd=2, col='red')
axis(2, ylim=c(0,max(med)),lwd=2,line=3.5, col='red',  col.axis = 'red')# colocar segundo eje 'Y', line = distancia entre eje y el grafico
points(1:length(time), med,pch=20, col='red') # si deseas agregr puntos al grafico, si no deseas comentas esta linea
mtext(2,text='Median Group Size',line=5.5, col='red') # colocar nombre al eje 'Y'

# generar tercer grafico (1er vector) y agregar su propio eje
par(new=T)
plot(x=1:length(time),y= grp, axes=F, ylim=c(0,max(grp)), xlab='', ylab='', 
     type='l',lty=3, main='',lwd=2 , col='blue')
axis(side=4, ylim=c(0,max(grp)),lwd=2,line=0, col='blue',col.axis = 'blue')
points(x=1:length(time),y=grp,pch=15, col='blue') # si deseas agregr puntos al grafico, si no deseas comentas esta linea
mtext(side=4,text='Number of Groups',line=2, col='blue')

# Agregar leyenda al grafico
# 'topleft' = posicion, legend = nombres de la leyenda, col = colores de las lineas de leyenda,
# box.lty = hace transparente la caja de leyenda, cex = tamaño de leyenda, lty = tipo de linea.
legend('topleft', legend = c('Population','Median Group Size','Number of Groups'),col = c('black','red','blue'),
       box.lty=0, bty = 'n', cex=0.7, x.intersp=0.2, lty=c(1,2,3))

# dev.off()

