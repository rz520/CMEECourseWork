# use try keyword to catch the error and keep going instead of having R throw you out

# write a function
doit <- function(x){
  temp_x <- sample(x, replace = TRUE)
  if(length(unique(temp_x)) > 30){ # only take mean if sample was sufficient
    print(paste("Mean of this sample was:", as.character(mean(temp_x))))
  }
  else{
    stop("Couldn't calculate mean: too few unique values!")
  }
}

popn <- rnorm(50)
hist(popn)

result <- lapply(1:15, function(i) try(doit(popn), FALSE))
class(result)
result

result <- vector("list", 15) # Preallocate/Initialze
for (i in 1:15){
  result[[i]] <- try(doit(popn), FALSE)
}






