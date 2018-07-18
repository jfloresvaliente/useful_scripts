
# INSTALACION DEL PAQUETE -------------------------------------------------

install.packages("RNetLogo")
require(RNetLogo)


# UBICACION DEL AREA DE TRABAJO -------------------------------------------

nl.path = "/home/jorge/Descargas/netlogo-5.2.0"
NLStart(nl.path)
model.path = "models/Sample Models/Earth Science/Fire.nlogo"
NLLoadModel(paste(nl.path, model.path,sep="/"))


# FUNCIONES NECESARIAS ----------------------------------------------------

sim = function (density){ # configuracion del modelo
  NLCommand ("set density" , density , "setup")
  NLCommand ("while [any? turtles] [go]");
  ret = NLReport ("(burned-trees / initial-trees)")
  return (ret)
}

rep.sim = function (density, rep){ # repeticon de la bateria de experimentos
  return(
    lapply(density,function (dens){
      replicate(rep, sim(dens))
    })
  )
}

# EXPERIMENTOS ------------------------------------------------------------

### ejercicio 1
x11()
#windows()
d = seq(1,100,1)
plot(d, unlist(rep.sim(d,1)),
     xlab="density" , ylab="percent burned")

### ejercicio 2
d = seq(30,60,5)
res = rep.sim(d , 10)
x11()
#windows()
boxplot(res, names=d, xlab="density", ylab="percent burned")

### ejercicio 3
d = seq(30,60,1)
res=rep.sim(d,20)
x11()
#windows()
boxplot(res, names=d, xlab="density", ylab="percent burned")


# FINALIZAR Y CERRAR NETLOGO ----------------------------------------------


NLQuit()

### CHAU