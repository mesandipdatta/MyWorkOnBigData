# Scatter-plot
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)

# Correlation refers to any of a broad class of statistical relationships involving dependence.
cor(Age, Height)

cols = c("red", "green4", "blue","brown")

plot(Age,Height, main="Scatterplot - Age Height Distribution", xlab="Age",ylab="Height",las=1,xlim=c(15,50),cex=1,col=cols ,lwd=4)

