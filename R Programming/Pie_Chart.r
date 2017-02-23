# Pie Chart
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)

count <- table(Indian)
count
pie(count,col=c(6,20),labels=c("Non-Indian","Indian"), main="Pie-Chart - Nationality of sample data")

