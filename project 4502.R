setwd('C:/Users/buutd/Desktop')
library(ggplot2)
library(reshape)
library(plyr)

accidents<- read.table('cleaned-accidents.csv',header = TRUE, sep = ',')


accidents1 <- ggplot(accidents, aes(Temperature.F.))
accidents1 + geom_density() + labs(x = "Temperature", y = "Range")

ggplot(data = accidents)+
  geom_smooth(mapping=aes(x=Temperature.F., y=Severity,))


ggplot(data =accidents )+
  geom_point(mapping=aes(Severity, Temperature.F., color = County))

pairs(~Severity+City+County+Temperature.F., data = accidents)

liner<-lm(Severity~City+County+Temperature.F., data = accidents)

liner

accidents1 <- ggplot(accidents, aes(Severity))
accidents1 + geom_histogram(binwidth = 0.4) + labs(x = "Severity", y = "Range")
