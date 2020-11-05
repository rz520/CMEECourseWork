load("../data/GPDDFiltered.RData")
install.packages("maps")
library(maps)
library(ggplot2)
mp <- NULL
mapworld<-borders("world",colour = "gray50",fill="white")
mp <- ggplot() + mapworld + ylim(-60,90)

long <- gpdd$long
lat <- gpdd$lat

mp2 <- mp + geom_point(data=gpdd, aes(x=long,y=lat, colour=common.name))

pdf("../result/gpdd.pdf", 14, 7)
mp2 + theme(legend.position = "none")
graphics.off()
