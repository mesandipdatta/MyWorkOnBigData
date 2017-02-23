# Box plot
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)

summary(Lungcap)

boxplot(Lungcap)

boxplot(Lungcap,main="Boxplot - Lung Capacity",ylab="Lung Capacity",ylim=c(0,16),las=1,col="grey")

# Method 1
boxplot(Lungcap ~ Gender,main="Boxplot - Lung Capacity",col=c(6,7))

# Method 2
boxplot(Lungcap[Gender=="Female"],Lungcap[Gender=="Male"], main="Boxplot - Lung Capacity by Gender", names = c("Female","Male"),col=c(6,7))
