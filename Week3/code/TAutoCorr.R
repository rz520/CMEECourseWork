load("../data/KeyWestAnnualMeanTemperature.Rdata")
temp <- ats$Temp
temp1 <- temp[-length(temp)]
temp2 <- temp[-1]
cor0 <- cor(temp1,temp2)
permute <- function(temp){
  sam <- sample(temp,length(temp),replace = F)
  temp1 <- sam[-length(sam)]
  temp2 <- sam[-1]
  return(cor(temp1, temp2))
}
result <- sapply(1:10000, function(i) permute(temp))
over <- which(result > cor0)
pvalue <- length(over)/10000
