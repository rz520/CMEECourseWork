# control flow tools in R including if, then, else and for and while loops

# if statements
a <- TRUE
if (a == TRUE){
    print("a is TRUE")
    } else {
    print("a is FALSE")
}

# write an if statement on a single line
z <- runif(1)
if (z <= 0.5) {print("Less than a half")}

# indent code for readability
z <- runif(1)
if (z <= 0.5) {
    print("Less than a half")
    }


# for loops, useful to repeat a task over some range of input values
for (i in seq(10)){
    j <- i * i
    print(paste(i, " squared is", j))
}

# loop over a vector of strings
for (species in c('Heliodoxa rubinoides',
                  'Boissonneaua jardini',
                  'Sula nebouxii')){
  print(paste('The species is ', species))
}

# for loop using a pre-existing vector
v1 <- c("a", "bc", "def")
for (i in v1){
    print(i)
}


# while loops, performing an operation till some condition is met
i <- 0
while (i < 10){
    i <- i + 1
    print(i^2)
}