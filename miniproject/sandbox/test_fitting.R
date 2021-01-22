rm(list = ls())
graphics.off()

require(minpack.lm)
require(ggplot2)

test <- read.csv("../data/modifiedPopulationGrowth.csv")

tdata <- subset(test, ID == unique(test$ID)[2])

# calculate log of PopBio
tdata$logP<- log(tdata$PopBio)

# draw log(PopBio)~Time picture
ggplot(tdata, aes(x = Time, y = logP)) + 
  geom_point(size = 3) + 
  labs(x = "Time (Hours)", y = "log (biomass)")

# sort tdata by Time
tdata <- tdata[order(tdata$Time),]

# count 15% and 85% value quantiles of tdata$logP
interval <- max(tdata$logP) - min(tdata$logP)
low <- min(tdata$logP) + 0.15 * interval
high <- max(tdata$logP) - 0.15 * interval

# use linear model to find r_max start point
lm_growth <- lm(logP ~ Time, data = subset(tdata, logP >= low & logP <= high))
summary(lm_growth)

# define logistic model as a function object
logistic_model <- function(t, r_max, N_0, K){
  return(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1)))
}

# fit logistic model
# define starting parameters for the logistic model
N_0_start <- min(tdata$PopBio) # lowest population size
K_start <- max(tdata$PopBio) # highest population size
r_max_start <- coef(lm_growth)[2] # use estimate from the OLS fitting

fit_logistic <- nlsLM(PopBio ~ logistic_model(t = Time, r_max, N_0, K), tdata,
                      list(r_max = r_max_start, N_0 = N_0_start, K = K_start))
summary(fit_logistic)

# plot the fit
timepoints <- seq(min(tdata$Time), max(tdata$Time), length.out = 200)

logistic_points <- logistic_model(t = timepoints, 
                                  r_max = coef(fit_logistic)[1], 
                                  N_0 = coef(fit_logistic)[2],
                                  K = coef(fit_logistic)[3])
df1 <- data.frame(timepoints, logistic_points)
df1$model <- "Logistic equation"
names(df1) <- c("Time", "PopBio", "model")

ggplot(tdata, aes(x = Time, y = PopBio)) +
  geom_point(size = 3) +
  geom_line(data = df1, aes(x = Time, y = PopBio, col = model), size = 1) +
  theme(aspect.ratio = 1) +
  labs(x = "Time", y = "Biomass")


ggplot(tdata, aes(x = Time, y = logP)) +
  geom_point(size = 3) +
  geom_line(data = df1, aes(x = Time, y = log(PopBio), col = model), size = 1) +
  theme(aspect.ratio = 1) +
  labs(x = "Time", y = "log(Biomass)")


# define Gompertz model as a function object
gompertz_model <- function(t, r_max, N_0, K, t_lag){
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}

# define starting parameters for the Gompertz model
N_0_start <- min(tdata$logP)
K_start <- max(tdata$logP)
r_max_start <- coef(lm_growth)[2]
t_lag_start <- tdata$Time[which.max(diff(diff(tdata$logP)/diff(tdata$Time))/diff(tdata$Time[-length(tdata$Time)]))]

# fit the Gompertz model
fit_gompertz <- nlsLM(logP ~ gompertz_model(t = Time, r_max, N_0, K, t_lag), tdata,
                      list(r_max = r_max_start, N_0 = N_0_start, K = K_start, t_lag = t_lag_start))
summary(fit_gompertz)

# plot 2 model fitting picture
timepoints <- seq(min(tdata$Time), max(tdata$Time), length.out = 200)

logistic_points <- log(logistic_model(t = timepoints, 
                                      r_max = coef(fit_logistic)[1], 
                                      N_0 = coef(fit_logistic)[2],
                                      K = coef(fit_logistic)[3]))

gompertz_points <- gompertz_model(t = timepoints, 
                                  r_max = coef(fit_gompertz)[1], 
                                  N_0 = coef(fit_gompertz)[2],
                                  K = coef(fit_gompertz)[3],
                                  t_lag = coef(fit_gompertz)[4])
df1 <- data.frame(timepoints, logistic_points)
df1$model <- "Logistic equation"
names(df1) <- c("Time", "logP", "model")

df2 <- data.frame(timepoints, gompertz_points)
df2$model <- "Gompertz model"
names(df2) <- c("Time", "logP", "model")

model_frame <- rbind(df1, df2)

ggplot(tdata, aes(x = Time, y = logP)) +
  geom_point(size = 3) +
  geom_line(data = model_frame, aes(x = Time, y = logP, col = model), size = 1) +
  theme(aspect.ratio = 1) +
  labs(x = "Time", y = "log(Biomass)")



# cubic model

fit_cubic <- lm(PopBio ~ poly(Time,3), data = tdata)

cubic_points <- predict.lm(fit_cubic, data.frame(Time = timepoints))

df3 <- data.frame(timepoints, cubic_points)
df3$model <- "Cubic polynomial equation"
names(df3) <- c("Time", "logP", "model")

model_frame <- rbind(df1, df2, df3)

ggplot(tdata, aes(x = Time, y = logP)) +
  geom_point(size = 3) +
  geom_line(data = model_frame, aes(x = Time, y = logP, col = model), size = 1) +
  theme(aspect.ratio = 1) +
  labs(x = "Time", y = "log(Biomass)")

# all subset model fitting, trycatch error and warning  无法收敛会是什么情况

# sampling and bounding   sample start value randomly


# calculate AIC, BIC, R^2, 参数置信区间(summary里有几颗星星)

# export results to a csv

# 需要在真实数据基础上加noise吗

sam_r_max <- runif(500, min = 0, max = 1.1 * r_max_start)
sam_N_0 <- runif(500, min = 0.9 * N_0_start, max = 1.1 * N_0_start)
sam_K <- runif(500, min = 0.9 * K_start, max = 1.1 * K_start)
sam_t_lag <- runif(500, min = 0, max = t_lag_start)
sam_df <- data.frame(sam_r_max, sam_N_0, sam_K, sam_t_lag)


for (i in seq(500)){
  # fit logistic model
  tryCatch({
    fit_logistic <- nlsLM(PopBio ~ logistic_model(t = Time, r_max, N_0, K), tdata,
                          list(r_max = sam_df$sam_r_max[i], 
                               N_0 = sam_df$sam_N_0[i], 
                               K = sam_df$sam_K[i]))
    sam_df$logAIC[i] <- AIC(fit_logistic)
  }, error = function(e){cat("")}) 
  
  # fit gompertz model
  tryCatch({
    fit_gompertz <- nlsLM(logP ~ gompertz_model(t = Time, r_max, N_0, K, t_lag), tdata,
                          list(r_max = sam_df$sam_r_max[i], 
                               N_0 = log(sam_df$sam_N_0[i]), 
                               K = log(sam_df$sam_K[i]), 
                               t_lag = sam_df$sam_t_lag[i]))
    sam_df$gompAIC[i] <- AIC(fit_gompertz)
  }, error = function(e){cat("")})
  
}
