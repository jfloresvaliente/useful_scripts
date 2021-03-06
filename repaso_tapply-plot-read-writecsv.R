#=============================================================================#
# Name   : R_base_repaso
# Author : Jorge Flores - Natalie Bravo
# Date   : 
# Version: 
# Aim    : 
# URL    : 
#=============================================================================#
# Crear 20 data frames de 50 filas cada uno
for(i in 1:20)
{
  # Generar valores aleatorios para cada una de las variables de cada data frame
  monthValues <- round(runif(50, 1, 12), 0)
  yearValues <- round(runif(50, 1996, 2012), 0)
  SSTValues <- round(runif(50, 15, 22), 1)
  SSSValues <- round(runif(50, 34.5, 35.5), 3)
  
  # Generar data frame
  tempDataFrame <- data.frame(year = yearValues, month = monthValues,
                              SSS = SSSValues, SST = SSTValues)
  
  # Generar nombre del archivo
  tempName <- paste("data_", i, ".csv", sep = "")
  
  # Generar archivo csv
  # Por defecto, 'write.csv' genera una columna al inicio en donde coloca los n�mero de fila
  # Para evitar esto, se utiliza el par�metro row.names = FALSE
  write.csv(tempDataFrame, tempName, row.names = FALSE)
}

# Ejercicio ---------------------------------------------------------------
# Leer cada uno de los 20 archivos csv creados,
# mostrar un cuadro resumen y generar climatolog�as por a�o para SST
# As� mismo, a�adir al gr�fico las l�neas de m�ximos y m�nimos obtenidas para cada climatolog�a

# Paso 1: Obtener la data concatenada en un solo objeto
climatoData <- NULL # Objeto donde se har� la concatenaci�n
for(i in 1:20)
{
  # Generar nombre del archivo que se leer�
  myName <- paste("data_", i, ".csv", sep = "")
  
  # Leer el archivo csv y colocarlo en un objeto
  myData <- read.csv(file = myName)
  
  # Concatenar en un solo objeto (climatoData)
  climatoData <- rbind(climatoData, myData)
}

# Paso 3: Generar cuadro resumen por mes y a�o
summaryTable <- tapply(climatoData$SST, list(climatoData$year, climatoData$month), mean, na.rm = TRUE)

# OJO: la funci�n list dentro del tapply contiene los vectores que servir�n en la agrupaci�n
# de los datos al momento de aplicar la funci�n (mean). Ya que estas variables servir� como 
# �ndice de agrupaci�n de la variable objetivo (clclimatoData$SST), deber�n tener la misma 
# longitud (lenght) que esta �ltima

# Convertir la tabla obtenida en un data frame y asignarle nombres a las columnas (meses)
summaryTable <- as.data.frame(summaryTable)
colnames(summaryTable) <- c("January", "February", "March", "April", "May", "June", "July", 
                            "August", "September", "October", "November", "December")

# Generar un csv a partir de la tabla resumen
write.csv(summaryTable, "Tabla resumen.csv", row.names = FALSE)


# Paso 2: Climatologia por A�O

# Generar los valores promediados por a�o
meanYear <- tapply(climatoData$SST, list(climatoData$year), mean, na.rm = TRUE)

# Generar los m�ximos por mes
maxYear <- tapply(climatoData$SST, list(climatoData$year), max, na.rm = TRUE)

# Generar los m�nimos por mes
minYear <- tapply(climatoData$SST, list(climatoData$year), min, na.rm = TRUE)

# Definir par�metros de ploteo
x11()
par(mfrow = c(1, 1))

# Plotear los promedios
plot(seq(1996, 2012), meanYear, xlim = c(1996, 2012), ylim = c(15, 22), 
     col = "blue", lwd = 2, type = "l",
     xlab = "Meses", ylab = "Temperatura (�C)", main = "Climatolog�a 1996 - 2012")

# A�adir l�neas de valores m�ximos
lines(seq(1996, 2012), maxYear, col = "red", lty = 4)

# A�adir l�neas de valores m�nimos
lines(seq(1996, 2012), minYear, col = "red", lty = 4)