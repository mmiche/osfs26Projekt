# Simulate data with low positive correlation
set.seed(2)
dat0 <- correlatio::simcor(obs=1000, rhos=.2)
# Transform both simulated variable x1 and x2 to a scale between 1 and 10.
dat0$Correlation_0.2353$x1 <-
    correlatio::lineartransform(futureRange = c(1,10),
                                vec = dat0$Correlation_0.2353$x1,
                                digits = 0)
dat0$Correlation_0.2353$x2 <-
    correlatio::lineartransform(futureRange = c(1,10),
                                vec = dat0$Correlation_0.2353$x2,
                                digits = 0)
cor(dat0$Correlation_0.2353)

# Randomly pick 12 values
set.seed(8)
dat <- dat0$Correlation_0.2353[sample(1:nrow(dat0$Correlation_0.2353), size = 12),]

cor(dat) # Correlation = .19

dat
colnames(dat) <- c("f1", "f6")

# Analysis 1: 90 percent compatibility interval
result1 <- cor.test(dat$f1, dat$f6, conf.level = .9, alternative = "greater")
result1$conf.int

# Visualize 90 percent compatibility interval
library(concurve)
# # Help pages of concurve package
# help(package="concurve")
# Use function curve_corr
cor_vis <- curve_corr(x=dat$f1, y=dat$f6, alternative = "greater", method="pearson")
concurve::ggcurve(cor_vis[[1]])

# Analysis 2: Visualize the most important part of the Pearson correlation coefficient.
library(correlatio)

result2 <- correlatio::corrio(data=dat)
result2$plot2
# -----------
# End
# -----------