requir("minipack.lm")

powMod <- function(x,a,b){
  return(a * x^b)
}

Data2Fit <- subset(MyData, Suborder == "Anisoptera")
Data2Fit <- Data2Fit[!is.na(Data2Fit$TotalLength),]

library("ggplot2")
ggplot(Data2Fit, aes(x = TotalLength, y = BodyWeight)) +
  geom_point(size=(3), color="red") + theme_bw() + labs(y="Body mass (mg)", x = "Wing length (mm)")

PowFit <- nlsLM(BodyWeight ~ powMod(TotalLength,a,b), data = Data2Fit, start = list(a = .1, b = .1))

Lengths <- seq(min(Data2Fit$TotalLength),max(Data2Fit$TotalLength),len=200)

coef(PowFit)

Predic2PlotPow <- powMod(Lengths,coef(PowFit)["a"],coef(PowFit)["b"])
plot(Data2Fit$TotalLength, Data2Fit$BodyWeight)
lines(Lengths, Predic2PlotPow, col="blue", lwd=2.5)


QuaFit <- lm(BodyWeight~poly(TotalLength,2), data=Data2Fit)
Predic2PlotQua <- predict.lm(QuaFit, data.frame(TotalLength=Lengths))

lines(Lengths, Predic2PlotQua, col="red", lwd=2.5)


RSS_Pow <- sum(residuals(PowFit)^2)
TSS_Pow <- sum((Data2Fit$BodyWeight - mean(Data2Fit$BodyWeight))^2)
Rsq_Pow <- 1 - (RSS_Pow/TSS_Pow)

RSS_Qua <- sum(residuals(QuaFit)^2)
TSS_Qua <- sum((Data2Fit$BodyWeight - mean(Data2Fit$BodyWeight))^2)
Rsq_Qua <- 1 - (RSS_Qua/TSS_Qua)


n <- nrow(Data2Fit)
pPow <- length(coef(PowFit))
pQua <- length(coef(QuaFit))

AIC_Pow <- n +2 + n * log((2 * pi) / n) + n * log(RSS_Pow) + 2 * pPow
AIC_Qua <- n +2 + n * log((2 * pi) / n) + n * log(RSS_Qua) + 2 * pQua
AIC_Pow - AIC_Qua



Population Growth

t <- seq(0,22,2)
N <- c(32500, 33000, 38000, 105000, 445000, 1430000, 3020000, 4720000, 5670000, 5870000, 5930000, 5940000)
set.seed(1234)
data <- data.frame(t,N + rnorm(length(t),sd=.1))
names(data) <- c("Time","N")

ggplot(data,aes(x=Time,y=N)) +
  geom_point(size=3) +
  labs(x="Time (Hours)", y="Population size(cells)")

data$LogN <- log(data$N)
ggplot(data,aes(x=Time,y=LogN)) +
  geom_point(size=3) +
  labs(x="Time (Hours)", y="log(cell number)")

(data[data$Time==10,]$LogN - data[data$Time==4,]$LogN)/(10-4)

lm_growth <- lm(LogN ~ Time, data = data[data$Time >2 & data$Time <12,])
summary(lm_growth)

# non-linear model for growth trajectories

logistic_model <- function(t,r_max,N_max,N_0){
  return(N_0 * N_max *exp(r_max*t)/(N_max + N_0 *(exp(r_max*t)-1)))
}
N_0_start <- min(data$N)
N_max_start <- max(data$N)
r_max_start <- 0.62

fit_logistic <- nlsLM(N ~ logistic_model(t=Time, r_max, N_max, N_0),data,
                      list(r_max=r_max_start, N_0=N_0_start, N_max=N_max_start))
summary(fit_logistic)

# plot it:
timepoints <- seq(0, 22, 0.1)

logistic_points <- logistic_model(t = timepoints, r_max = coef(fit_logistic)["r_max"], N_max = coef(fit_logistic)["N_max"], N_0 = coef(fit_logistic)["N_0"])
df1 <- data.frame(timepoints, logistic_points)
df1$model <- "Logistic equation"
names(df1) <- c("Time", "N", "model")

ggplot(data, aes(x = Time, y = N)) +
  geom_point(size = 3) +
  geom_line(data = df1, aes(x = Time, y = N, col = model), size = 1) +
  theme(aspect.ratio=1)+ # make the plot square 
  labs(x = "Time", y = "Cell number")

# log-transformed axis
ggplot(data, aes(x = Time, y = LogN)) +
  geom_point(size = 3) +
  geom_line(data = df1, aes(x = Time, y = log(N), col = model), size = 1) +
  theme(aspect.ratio=1)+ 
  labs(x = "Time", y = "log(Cell number)")





