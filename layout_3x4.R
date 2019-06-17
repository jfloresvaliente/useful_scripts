png(filename = "C:/Users/ASUS/Desktop/layoutplot6.png", width = 1050, height = 1050, res = 120)

x_long <- 6
y_long <- 5
mat <- matrix(1:12, ncol= 4, byrow = T)
layout(mat = mat, widths = c(lcm(x_long), rep(lcm(x_long-1),2), lcm(x_long)),
       heights = c(lcm(y_long), lcm(y_long-1), lcm(y_long)))
# layout.show(n = 12)
cx <- 1/cm(1)
for(i in 1:12){
  if(i == 1)            par(mai = c(0, cx, cx, 0 ))
  if(i == 2 | i == 3)   par(mai = c(0, 0 , cx, 0 ))
  if(i == 4)            par(mai = c(0, 0 , cx, cx))
  if(i == 5)            par(mai = c(0, cx, 0 , 0 ))
  if(i == 6 | i == 7)   par(mai = c(0, 0 , 0 , 0 ))
  if(i == 8)            par(mai = c(0, 0 , 0 , cx))
  if(i == 9)            par(mai = c(cx,cx, 0 , 0 ))
  if(i == 10 | i == 11) par(mai = c(cx, 0, 0 , 0 ))
  if(i == 12)           par(mai = c(cx, 0, 0 , cx))
  
  plot(rnorm(10))
  mtext(text = paste('PLOT', i), side = 3, line = -4, adj = 0.5, font = 2)
  box("figure", lwd=2, col='red')
  print(par('pin'))
}
dev.off()
