library(stringr)
dat <- read.table('C:/Users/jflores/Desktop/gastos_senegal.csv', header = T, sep = ';')

month      <- unlist(str_split(string = dat$date, pattern = '/'))
month      <- month[seq(1,length(month),3)]
dat$month  <- month
dat$gasto  <- NA

item_gasto <- list(
  transporte = c('taxi','bus'),
  comida     = c('galletas','coca','fruta','cena','almuerzo','agua','pan',
                 'comida','pollo'),
  hospedaje  = c('alojamiento'),
  varios     = c('cuenta','devolucion','minimarket','papel','detergente',
                 'ganchos','sandalias','orange','recarga','utiles','halls',
                 'carbon','monedas')
  )

for(i in 1:length(item_gasto)){
  m <- item_gasto[i]
  m_name <- names(m)
  m_item <- unlist(m)
  
  for(j in 1:length(m_item)){
    n <- which(grepl(pattern = m_item[j], x = dat$item, ignore.case = T) == 1)
    dat$gasto[n] <- m_name
  }
}

tapply(dat$CFA, list(dat$month, dat$gasto), sum, na.rm = T)
mon <- tapply(dat$CFA, list(dat$month), sum, na.rm = T)/1000
x11()
barplot(mon, ylim = c(0,270))
box()
abline(h = seq(200, 260, 20), lty = 2)

# library("ggmap")
# us <- c(left = -100, bottom = -20, right = -70, top = 0)
# get_stamenmap(us, zoom = 5, maptype = "toner-lite") %>% ggmap() 
