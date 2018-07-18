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
  # Por defecto, 'write.csv' genera una columna al inicio en donde coloca los número de fila
  # Para evitar esto, se utiliza el parámetro row.names = FALSE
  write.csv(tempDataFrame, tempName, row.names = FALSE)
}

# Ejercicio ---------------------------------------------------------------
# Leer cada uno de los 20 archivos csv creados,
# mostrar un cuadro resumen y generar climatologías por año para SST
# Así mismo, añadir al gráfico las líneas de máximos y mínimos obtenidas para cada climatología

# Paso 1: Obtener la data concatenada en un solo objeto
climatoData <- NULL # Objeto donde se hará la concatenación
for(i in 1:20)
{
  # Generar nombre del archivo que se leerá
  myName <- paste("data_", i, ".csv", sep = "")
  
  # Leer el archivo csv y colocarlo en un objeto
  myData <- read.csv(file = myName)
  
  # Concatenar en un solo objeto (climatoData)
  climatoData <- rbind(climatoData, myData)
}

# Paso 3: Generar cuadro resumen por mes y año
summaryTable <- tapply(climatoData$SST, list(climatoData$year, climatoData$month), mean, na.rm = TRUE)

# OJO: la función list dentro del tapply contiene los vectores que servirán en la agrupación
# de los datos al momento de aplicar la función (mean). Ya que estas variables servirá como 
# índice de agrupación de la variable objetivo (clclimatoData$SST), deberán tener la misma 
# longitud (lenght) que esta última

# Convertir la tabla obtenida en un data frame y asignarle nombres a las columnas (meses)
summaryTable <- as.data.frame(summaryTable)
colnames(summaryTable) <- c("January", "February", "March", "April", "May", "June", "July", 
                            "August", "September", "October", "November", "December")

# Generar un csv a partir de la tabla resumen
write.csv(summaryTable, "Tabla resumen.csv", row.names = FALSE)


# Paso 2: Climatologia por AñO

# Generar los valores promediados por año
meanYear <- tapply(climatoData$SST, list(climatoData$year), mean, na.rm = TRUE)

# Generar los máximos por mes
maxYear <- tapply(climatoData$SST, list(climatoData$year), max, na.rm = TRUE)

# Generar los mínimos por mes
minYear <- tapply(climatoData$SST, list(climatoData$year), min, na.rm = TRUE)

# Definir parámetros de ploteo
x11()
par(mfrow = c(1, 1))

# Plotear los promedios
plot(seq(1996, 2012), meanYear, xlim = c(1996, 2012), ylim = c(15, 22), 
     col = "blue", lwd = 2, type = "l",
     xlab = "Meses", ylab = "Temperatura (°C)", main = "Climatología 1996 - 2012")

# Añadir líneas de valores máximos
lines(seq(1996, 2012), maxYear, col = "red", lty = 4)

# Añadir líneas de valores mínimos
lines(seq(1996, 2012), minYear, col = "red", lty = 4)