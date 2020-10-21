# This script reads a csv file containing trees' species, distance and angle, 
# calculates all of the trees' height,
# append heights to the origin csv file as a new csv file stored in ../result
#
# OUTPUT
# A csv file contains the calculated tree heights along with the original data

TreeData <- read.csv('../data/trees.csv')   # read the csv file and store it as a data.frame

# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using the trigonometric formula
# 
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:  The angle of elevation of tree
# distance: The distance from base of tree (e.g. meters)
# 
# OUTPUT
# The heights of the tree, same units as "distance"

TreeHeight <- function(degrees, distance){
  radians <- degrees * pi / 180
  height <- distance * tan(radians)
  return(height)
}

Height <- c()
for (i in seq(nrow(TreeData))){
  Height <- c(Height, TreeHeight(TreeData[i,2],TreeData[i,3]))
}
TreeData$Height.m <- Height

write.csv(TreeData, file = '../result/TreeHts.csv')
