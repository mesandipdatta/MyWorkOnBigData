# Histogram
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)

# Prep to break Bins 
min(Age)
max(Age)
bins=seq(min(Age),max(Age),1)

hist(Age,breaks=bins, ylim=c(0,5),xlim=c(20,50),main="Histogram - Age Distribution",col=5,las=1 , ylab="Frequency of Age")


# Density Curve
lines(density(Age),col=2,lwd=3)

