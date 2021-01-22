# This script analyse AIC, BIC and Rsq of cubic, logistic and Gompertz model, and then draw graph and save table to visualize model fitting performance
rm(list = ls())
graphics.off()

require(reshape2)
require(ggplot2)

# load AIC, BIC, Rsq values and modified population growth data
model_AIC <- read.csv("../result/AIC.csv")
model_BIC <- read.csv("../result/BIC.csv")
model_RSq <- read.csv("../result/RSq.csv")
data <- read.csv("../data/modifiedPopulationGrowth.csv")

# use AIC to calculate AICc and save as a new table
model_AICc <- model_AIC
for (i in 1:length(model_AICc$ID)){
  sub <- subset(data, ID == unique(data$ID)[model_AIC$ID[i]])
  len <- length(sub$ID)
  model_AICc$size[i] <- len
  if (len > 5){
    model_AICc$cubic[i] <- model_AICc$cubic[i] + (2 * 4 * 4 + 2 * 4)/(len - 5)
    model_AICc$logistic[i] <- model_AICc$logistic[i] + (2 * 3 * 3 + 2 * 3)/(len - 4)
    model_AICc$gompertz[i] <- model_AICc$gompertz[i] + (2 * 4 * 4 + 2 * 4)/(len - 5)
  }
}
# AICc can only be calculated when sample size over 5, delete nonsense value
model_AICc <- subset(model_AICc, model_AICc$size > 5)
model_AICc <- model_AICc[,1:4]

# data wrangling and plotting AIC
mAIC <- melt(model_AIC, id = "ID", variable.name = "model", value.name = "AIC")

pdf("../result/modelfitting/AIC.pdf")
print(ggplot(mAIC, aes(x = ID, y = AIC)) +
        geom_line(data = mAIC, aes(x = ID, y = AIC, col = model), size = 1) +
        theme(aspect.ratio = 1) +
        labs(title = "Population Growth Model Fitting Performance AIC"))
graphics.off()

# data wrangling and plotting AICc
mAICc <- melt(model_AICc, id = "ID", variable.name = "model", value.name = "AIC")

pdf("../result/modelfitting/AICc.pdf")
print(ggplot(mAICc, aes(x = ID, y = AICc)) +
        geom_line(data = mAICc, aes(x = ID, y = AIC, col = model), size = 1) +
        theme(aspect.ratio = 1) +
        labs(title = "Population Growth Model Fitting Performance AICc"))
graphics.off()

# data wrangling and plotting BIC
mBIC <- melt(model_BIC, id = "ID", variable.name = "model", value.name = "BIC")

pdf("../result/modelfitting/BIC.pdf")
print(ggplot(mBIC, aes(x = ID, y = BIC)) +
        geom_line(data = mBIC, aes(x = ID, y = BIC, col = model), size = 1) +
        theme(aspect.ratio = 1) +
        labs(title = "Population Growth Model Fitting Performance BIC"))
graphics.off()

# data wrangling and plotting Rsq
mRSq <- melt(model_RSq, id = "ID", variable.name = "model", value.name = "RSq")

pdf("../result/modelfitting/RSq.pdf")
print(ggplot(mRSq, aes(x = ID, y = RSq)) +
        geom_line(data = mRSq, aes(x = ID, y = RSq, col = model), size = 1) +
        theme(aspect.ratio = 1) +
        labs(title = "Population Growth Model Fitting Performance R^2"))
graphics.off()


# define a function to find out which model shows the lowest criteria value and count
stat <- function(model){
  gnum <- 0
  for (i in 1:length(model$ID)){
    if (model$gompertz[i] <= model$cubic[i] && model$gompertz[i] <= model$logistic[i]){
      gnum <- gnum + 1
    } 
  }
  
  lnum <- 0
  for (i in 1:length(model$ID)){
    if (model$logistic[i] < model$cubic[i] && model$logistic[i] < model$gompertz[i]){
      lnum <- lnum + 1
    }
  }
  
  cnum <- 0
  for (i in 1:length(model$ID)){
    if (model$cubic[i] < model$logistic[i] && model$cubic[i] < model$gompertz[i]){
      cnum <- cnum + 1
    }
  }
  result <- c(gnum, lnum, cnum)
}

# define a function to find out which model shows the highest criteria value and count
stat1 <- function(model){
  gnum <- 0
  for (i in 1:length(model$ID)){
    if (model$gompertz[i] >= model$cubic[i] && model$gompertz[i] >= model$logistic[i]){
      gnum <- gnum + 1
    } 
  }
  
  lnum <- 0
  for (i in 1:length(model$ID)){
    if (model$logistic[i] > model$cubic[i] && model$logistic[i] > model$gompertz[i]){
      lnum <- lnum + 1
    }
  }
  
  cnum <- 0
  for (i in 1:length(model$ID)){
    if (model$cubic[i] > model$logistic[i] && model$cubic[i] > model$gompertz[i]){
      cnum <- cnum + 1
    }
  }
  result <- c(gnum, lnum, cnum)
}

# calculate the best model proportion in different criterion
AIC <- stat(model_AIC)
BIC <- stat(model_BIC)
Rsq <- stat1(model_RSq)
AICc <- stat(model_AICc)

# create a data frame for best model proportion and save it as a csv file
a <- data.frame(AIC,AICc,BIC,Rsq)
row.names(a) <- c("Gompertz", "Logistic", "Cubic")
write.csv(a, "../result/best.csv")


print("plot_analysis.R is run successfully")


