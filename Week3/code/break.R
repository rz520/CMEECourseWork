# a control flow tool, break, is useful to break out of loops when some condition is met

i <- 0 #Initialize i
    while(i < Inf) {
      if(i == 10) {
        break
      } # Break out of the while loop!
      else {
        cat("i equals " , i , "\n")
        i <- i + 1 # Update i
      }
    }