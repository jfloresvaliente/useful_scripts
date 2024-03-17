#=============================================================================#
# Name   : TimeDifferenceCalculator
# Author : Jorge Flores-Valiente
# Date   : 
# Version:
# Aim    : Calculate the time difference in hours.
# URL    : 
#=============================================================================#
library(lubridate)

hora1 <- ymd_hms('2024/02/06 07:54:00') # Start time. Format Year/Month/Day Hour:Minutes:Seconds
hora2 <- ymd_hms('2024/02/06 11:19:00') # Final time. Format Year/Month/Day Hour:Minutes:Seconds
hrs <- difftime(hora2, hora1, units = 'hours')
hrs <- round(hrs[[1]], 2)
print(paste('Elapsed Time in Hours:', hrs))

#=============================================================================#
# END OF PROGRAM
#=============================================================================#