
#---------------------------------------------------------#
# x11()
par(mfrow = c(1,2))
df <- data.frame(stolpec1 = 10 * runif(10), stolpec2 = 30 * runif(10))
barplot(df$stolpec1)
lines(df$stolpec2/10) #implicitno x = 1:10
points(df$stolpec2/10)

# x11()
df.bar <- barplot(df$stolpec1)
lines(x = df.bar, y = df$stolpec2/10)
points(x = df.bar, y = df$stolpec2/10)
# 
#install.packages('plotrix')
# x11()
library(plotrix)
# barp(df$stolpec1, col = 'grey70')
# lines(df$stolpec2/10)
# points(df$stolpec2/10)
# 
x <- rnorm(100)
y <- x + rnorm(100)
lmfit <- lm(y~x)
plot(x, y, xlim=c(-3.5, 3.5))
ablineclip(lmfit, x1 = -2, x2 = 2, lty = 2)
ablineclip(h = 0, x1 = -2,x2 = 2,lty = 3, col = 'red')
ablineclip(v = 0, y1 = -2.5, y2 = 1.5, lty=4, col = 'green')
# 
# x=c(99,9,104,67,86,53,83,29,127,31,179,86,74,80,100,150,68,18,81,47)
# names(x)= c('A','C','E','D','G','F','I','H','K','M','L','N','Q','P','S','R','T','W','V','Y')
# barplot(x)
# y= c(105673,18140,92426,76776,93974,53470,75155,30700,77847,28863,124602,55703,
#      50160,60685,78693,69581,70846,18285,92789,45728)
# names(y)= c('A','C','E','D','G','F','I','H','K','M','L','N','Q','P','S','R','T','W','V','Y')
# barplot(y)






