# Bar Chart
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)
count <- table(Gender)
count
gender.percent <- table(Gender)/43



barplot(gender.percent,main="Barplot - Gender Distribution",xlab="Gender",ylab="Percentage",las=1,ylim=c(0,1), names.arg=c("Female","Male"),col=c(6,7))

barplot(gender.percent,main="Barplot - Gender Distribution",xlab="Percentage",ylab="Gender",las=1, xlim=c(0,1), names.arg=c("Female","Male"),col=c(6,7), horiz=TRUE)

