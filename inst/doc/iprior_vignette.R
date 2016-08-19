## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 6.5, fig.height = 4.33, 
                      fig.align = "center")
library(iprior)

## ----syntax, eval=FALSE--------------------------------------------------
#  mod <- iprior(y ~ x, data = dat)  # formula based input
#  mod <- iprior(y = dat$y, x = dat$x)  # non-formula based input

## ----data1---------------------------------------------------------------
str(stackloss)

## ----mod1----------------------------------------------------------------
mod.iprior <- iprior(stack.loss ~ ., data = stackloss)

## ----summary_mod1--------------------------------------------------------
summary(mod.iprior)

## ----plot1, echo=FALSE---------------------------------------------------
plot(y = residuals(mod.iprior), x = fitted(mod.iprior), pch = 19,
     ylab = "Residuals", xlab = "Fitted values", main = "Fitted vs. Residuals")
mod.lm <- lm(stack.loss ~ ., stackloss)
points(y = residuals(mod.lm), x = fitted(mod.lm), col = 2)
abline(0, 0, col = "gray", lty = 2)
legend("bottomleft", legend = c("iprior", "lm"), pch = c(19,1), col = c(1,2))

## ----data2---------------------------------------------------------------
data(hsbsmall)
str(hsbsmall)

## ----mod2----------------------------------------------------------------
(mod.iprior <- iprior(mathach ~ ses + schoolid + ses:schoolid, data = hsbsmall))

## ----plot2---------------------------------------------------------------
plot(mod.iprior, plots = "fitted")

## ----data3---------------------------------------------------------------
data(datfbm)
str(datfbm)

## ----mod3----------------------------------------------------------------
mod.iprior <- iprior(y ~ x, data = datfbm, model = list(kernel = "FBM"), control = list(silent = TRUE))
summary(mod.iprior)

## ----mod3plot------------------------------------------------------------
plot(mod.iprior, plots = "fitted")

