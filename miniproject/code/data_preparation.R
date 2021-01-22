# This script pretreat data before fit models to experiments data including data wrangling and unreasonable data deletion
rm(list = ls())
graphics.off()

data <- read.csv("../data/LogisticGrowthData.csv")

# create a new column ID to identify different dataset
ID <- paste(data$Species, data$Temp, data$Medium, data$Citation, sep = "_")

# wrangling data
data1 <- cbind(ID, data[2:3])

# delete an unreliable dataset
data2 <- subset(data1, ID != ID[583]) 

# delete negative time and popbio
datafilt <- subset(data2, Time >= 0 & PopBio > 0) 

# save modified data
write.csv(datafilt, "../data/modifiedPopulationGrowth.csv", row.names = FALSE)

print("data_preparation.R is run successfully")
