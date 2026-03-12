# Original data
dat <- data.frame(f1=c(4, 5, 4, 3, 5, 1, 1, 3, 2, 8),
                  f6=c(5, 7, 9, 9, 10, 6, 10, 9, 8, 10))
str(dat)

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