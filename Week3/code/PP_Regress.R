# draw and save a pdf file showing linear regression of 18 subsets of the data
# and write regression results to a formatted table in csv

MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv", stringsAsFactors = FALSE)

MyDF$Type.of.feeding.interaction <- as.factor(MyDF$Type.of.feeding.interaction)
MyDF$Predator.lifestage <- as.factor(MyDF$Predator.lifestage)

pdf("../result/PP_Regress.pdf")
qplot(log(Prey.mass), log(Predator.mass), data = MyDF,facets = Type.of.feeding.interaction ~.,colour = Predator.lifestage, 
      shape= I(3)) + geom_smooth(method = "lm", fullrange = TRUE) + theme(legend.position = "bottom")
graphics.off()

library(dplyr)

allsubset <- MyDF %>% group_by(Type.of.feeding.interaction, Predator.lifestage) %>% count()
allsubset <- as.data.frame(allsubset[,1:2])

regression <- c("regression intercept", "regression slope", "R^2", "F-statistic value", "p-value")

feeding <- unique(MyDF$Type.of.feeding.interaction)
predlife <- unique(MyDF$Predator.lifestage)

library(tidyverse)

for (i in sort(feeding)){
  subset1 <- subset(MyDF, Type.of.feeding.interaction == i)
  for (j in sort(predlife)){
    subset2 <- subset(subset1, Predator.lifestage == j)
    if (length(subset2$Predator.lifestage) >= 2){
      model <- lm(log(Predator.mass)~log(Prey.mass), data=subset2)
      regression <- rbind(regression, c(coef(model),broom::glance(model)[[1]], broom::glance(model)[[4]], broom::glance(model)[[5]]))
    }
  }
}

reg <- as.data.frame(regression[-1,])
colnames(reg) <- regression[1,]

result <- cbind(allsubset, reg)
row.names(result) <- NULL

write.csv(result, "../result/PP_Regress_Results.csv")

