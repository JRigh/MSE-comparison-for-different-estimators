#--------------------------------------------
# Comparison of MSE for a binomial proportion
#--------------------------------------------

theta_mle = theta_bayes = seq(0.1, 1, 0.01); n = 1
mse_mle = theta_mle*(1-theta_mle) / n

var_bayes = (n*theta_bayes*(1-theta_bayes) ) /(n+2)^2
bias_bayes = (n*theta_bayes + n - theta_bayes) / (n+2) 
mse_bayes = var_bayes + bias_bayes^2

plot(theta_mle, mse_mle, type = 'l')
lines(theta_bayes, mse_bayes)

# dataframe
data_frame = data.frame('theta' = theta_mle, 'MSE MLE' = mse_mle, 
                        'MSE Bayes' = mse_bayes)

library(tidyverse)
ggplot(data = data_frame) +
  geom_line(aes(x = theta, y = mse_mle, color = 'MSE MLE'), lwd = 1.2) +
  geom_line(aes(x = theta, y = mse_bayes, color = 'MSE Bayes'), lwd = 1.2) +
  scale_color_manual(name = 'MSE', values = c( "black",'darkred')) +
  labs(title = 'Comparison of MSE accross all values of theta MLE and theta Bayes',
                            subtitle = 'for n = 1',
                            y="MSE", x="theta") +
  theme(axis.text=element_text(size=8),
        axis.title=element_text(size=8),
        plot.subtitle=element_text(size=10, face="italic", color="darkred"),
        panel.background = element_rect(fill = "white", colour = "grey50"),
        panel.grid.major = element_line(colour = "grey90"))

#----
# end
#----

