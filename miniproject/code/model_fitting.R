# divide datasets and fit cubic, logistic and Gompertz model to these datasets with drawing fitting lines, 
# also AIC, BIC and Rsq are calculated and save as csv files
rm(list = ls())
graphics.off()

require(minpack.lm)
require(ggplot2)

data <- read.csv("../data/modifiedPopulationGrowth.csv")

# define logistic model as a function object
logistic_model <- function(t, r_max, N_0, K){
  return(log(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1))))
}

# define Gompertz model as a function object
gompertz_model <- function(t, r_max, N_0, K, t_lag){
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}

model_fitting_AIC <- c("ID", "cubic", "logistic", "gompertz")
model_fitting_BIC <- c("ID", "cubic", "logistic", "gompertz")
model_fitting_RSq <- c("ID", "cubic", "logistic", "gompertz")

for (j in 1:length(unique(data$ID))){
  tryCatch({
    sub <- subset(data, ID == unique(data$ID)[j])
    # sub$ID <- i
    
    # calculate log of PopBio
    sub$logP<- log(sub$PopBio)
    
    # sort data subset by Time
    sub <- sub[order(sub$Time),]
    
    # linear model fitting: cubic polinomial equation
    fit_cubic <- lm(logP ~ poly(Time,3), data = sub)
    
    
    # nonlinear model fitting (mechanistic)
    # estimate r_max by straight linear model
    # count 15% and 85% value quantiles of sub$logP
    interval <- max(sub$logP) - min(sub$logP)
    low <- min(sub$logP) + 0.15 * interval
    high <- max(sub$logP) - 0.15 * interval
    # use linear model to find r_max start point
    lmdata <- subset(sub, logP >= low & logP <= high)
    if (length(lmdata$ID) >= 2 ){
      lm_growth <- lm(logP ~ Time, data = lmdata)
    } else {
      lm_growth <- lm(logP ~ Time, data = sub)
    }
    
    # define starting parameters for the nonlinear models
    N_0_start <- min(sub$PopBio) # lowest population size
    K_start <- max(sub$PopBio) # highest population size
    r_max_start <- coef(lm_growth)[2] # use estimate from the OLS fitting
    t_lag_start <- sub$Time[which.max(diff(diff(sub$logP)/diff(sub$Time))/diff(sub$Time[-length(sub$Time)]))]
    
    # sample start point
    sam_r_max <- runif(400, min = 0, max = 1.1 * r_max_start)
    sam_N_0 <- runif(400, min = 0.9 * N_0_start, max = 1.1 * N_0_start)
    sam_K <- runif(400, min = 0.9 * K_start, max = 1.1 * K_start)
    sam_t_lag <- runif(400, min = 0, max = t_lag_start)
    sam_df <- data.frame(sam_r_max, sam_N_0, sam_K, sam_t_lag)
    
    
    # using sampling starting values to fit nonlinear models
    for (i in seq(400)){
      # fit logistic model
      tryCatch({
        fit_logistic <- nlsLM(logP ~ logistic_model(t = Time, r_max, N_0, K), sub,
                              list(r_max = sam_df$sam_r_max[i], 
                                   N_0 = sam_df$sam_N_0[i], 
                                   K = sam_df$sam_K[i]))
        sam_df$logAIC[i] <- AIC(fit_logistic)
      }, error = function(e){cat("")}) 
      
      # fit gompertz model
      tryCatch({
        fit_gompertz <- nlsLM(logP ~ gompertz_model(t = Time, r_max, N_0, K, t_lag), sub,
                              list(r_max = sam_df$sam_r_max[i], 
                                   N_0 = log(sam_df$sam_N_0[i]), 
                                   K = log(sam_df$sam_K[i]), 
                                   t_lag = sam_df$sam_t_lag[i]))
        sam_df$gompAIC[i] <- AIC(fit_gompertz)
      }, error = function(e){cat("")})
      
    }
    
    logpara <- which.min(sam_df$logAIC)
    gomppara <- which.min(sam_df$gompAIC)
    
    
    # using start value after sampling to fit logistic model
    fit_logistic <- nlsLM(logP ~ logistic_model(t = Time, r_max, N_0, K), sub,
                           list(r_max = sam_df$sam_r_max[logpara], 
                                N_0 = sam_df$sam_N_0[logpara], 
                                K = sam_df$sam_K[logpara]))
    
    # using start value after sampling to fit gompertz model 
    fit_gompertz <- nlsLM(logP ~ gompertz_model(t = Time, r_max, N_0, K, t_lag), sub,
                            list(r_max = sam_df$sam_r_max[gomppara], 
                                 N_0 = log(sam_df$sam_N_0[gomppara]), 
                                 K = log(sam_df$sam_K[gomppara]), 
                                 t_lag = sam_df$sam_t_lag[gomppara]))
    
    
    
    # model fitting consequence
    model_fitting_AIC <- rbind(model_fitting_AIC, c(j, AIC(fit_cubic),
                                                    AIC(fit_logistic), 
                                                    AIC(fit_gompertz)))
    model_fitting_BIC <- rbind(model_fitting_BIC, c(j, BIC(fit_cubic),
                                                    BIC(fit_logistic),
                                                    BIC(fit_gompertz)))
    RSS_cubic <- sum(residuals(fit_cubic)^2)
    RSS_logistic <- sum(residuals(fit_logistic)^2)
    RSS_gompertz <- sum(residuals(fit_gompertz)^2)
    TSS <- sum((sub$logP - mean(sub$logP))^2)
    
    model_fitting_RSq <- rbind(model_fitting_RSq, c(j, 1- (RSS_cubic/TSS),
                                                    1 - (RSS_logistic/TSS),
                                                    1 - (RSS_gompertz/TSS)))
    
    # plot models
    timepoints <- seq(min(sub$Time), max(sub$Time), length.out = 200)
    
    logistic_points <- logistic_model(t = timepoints, 
                                      r_max = coef(fit_logistic)[1], 
                                      N_0 = coef(fit_logistic)[2],
                                      K = coef(fit_logistic)[3])
    
    gompertz_points <- gompertz_model(t = timepoints, 
                                      r_max = coef(fit_gompertz)[1], 
                                      N_0 = coef(fit_gompertz)[2],
                                      K = coef(fit_gompertz)[3],
                                      t_lag = coef(fit_gompertz)[4])
    
    cubic_points <- predict.lm(fit_cubic, data.frame(Time = timepoints))
    
    df1 <- data.frame(timepoints, logistic_points)
    df1$model <- "Logistic equation"
    names(df1) <- c("Time", "logP", "model")
    
    df2 <- data.frame(timepoints, gompertz_points)
    df2$model <- "Gompertz model"
    names(df2) <- c("Time", "logP", "model")
    
    df3 <- data.frame(timepoints, cubic_points)
    df3$model <- "Cubic polynomial equation"
    names(df3) <- c("Time", "logP", "model")
    
    model_frame <- rbind(df1, df2, df3)
    
    # result/modelfitting directory should be created at first
    filename <- paste("../result/modelfitting/", j, ".pdf", sep = "")
    
    pdf(filename)
    
    p <- ggplot(sub, aes(x = Time, y = logP)) +
      geom_point(size = 3) +
      geom_line(data = model_frame, aes(x = Time, y = logP, col = model), size = 1) +
      theme(aspect.ratio = 1) +
      labs(x = "Time", y = "log(Biomass)", title = "Population Growth Model fitting")
    print(p)
    graphics.off()
  }, error = function(e){cat("ERROR:", conditionMessage(e), "\n")})
}

# save model fitting statistical measures data to csv file
colnames(model_fitting_AIC) <- model_fitting_AIC[1,]
write.csv(model_fitting_AIC[-1,], "../result/AIC.csv", row.names = FALSE)

colnames(model_fitting_BIC) <- model_fitting_BIC[1,]
write.csv(model_fitting_BIC[-1,], "../result/BIC.csv", row.names = FALSE)

colnames(model_fitting_RSq) <- model_fitting_RSq[1,]
write.csv(model_fitting_RSq[-1,], "../result/RSq.csv", row.names = FALSE)


print("model_fitting.R is run successfully")



