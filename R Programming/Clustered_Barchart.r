# Clustered Barchart
demodata <- read.csv(file="DatafileCSV2.csv", header=T, sep=",")
head(demodata)
tail(demodata)
str(demodata)
attach(demodata)

table(Smoke,Gender)
tablesmokegender <- table(Smoke,Gender)  
tablesmokegender

# Clustered Barchart
barplot(tablesmokegender,main="Clustered Barchart - Gender Smoking Distribution" ,beside=T,ylim=c(0,20),col=c(3,2),xlab="Gender", ylab="Person Count",las=1)  

# Stacked Barchart
barplot(tablesmokegender,main="Stacked Barchart - Gender Smoking Distribution" ,ylim=c(0,40),col=c(3,2),xlab="Gender", ylab="Person Count",las=1)  

legend("topright",legend=c("No-Smoke","Smoke"),fill=c(3,2))

