#=============================================================================#
# Name   : EnergyConsumptionCalculator
# Author : Jorge Flores-Valiente
# Date   : 
# Version:
# Aim    : Calculate the energy consumed in kw/h.
# URL    : 
#=============================================================================#

# Calcular consumo de energia Alita
library(lubridate)

# Diferencia en lectura de medidor
lec1 <- 11017.02 # Lectura inicial de medidor 
lec2 <- 11017.27 # Lectura final de medidor
lec_diff <- lec2 - lec1

# Horas transcurridas
hora1 <- ymd_hms('2024/01/09 21:05:00') # Hora de lectura inicial de medidor
hora2 <- ymd_hms('2024/01/10 03:37:00') # Hora de lectura final de medidor
hrs <- difftime(hora2, hora1, units = 'hours')
hrs <- round(hrs[[1]], 2)

# Calcular Kw/h
Kwh <- lec_diff/hrs

# Consumo mensual
Kwm <- Kwh * 30 * 24    # Kw * dias * horas * year

print(paste('Kw/h   : ', round(Kwh, 3)))
print(paste('Kw/mes : ', round(Kwm, 3)))

#=============================================================================#
# END OF PROGRAM
#=============================================================================#