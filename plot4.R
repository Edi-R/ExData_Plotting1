#Coursera - Exploratory Data Analysis
#Project 1

#Load Data from UC Irvine Machine Learning Repository 
#   Individual Household electric power consumption data set
#select data for 2007-02-01 to 2007-02-02
#plot 4 graphs on 1 page

#NOTE: sqldf package must be installed (run install.packages("sqldf")

#load data for 2007-02-01 to 2007-02-02
library(sqldf)
c<-read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#plot to screen
windows()
par(mfrow=c(2,2))
plot(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex=0.6)
plot(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Voltage,type="l",xlab="Date/Time",ylab="Voltage",cex=0.6)
plot(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Sub_metering_2,type="l",col="Red")
points(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Sub_metering_3,type="l",col="Blue")
legend("topright",lty=1,cex=0.6,col=c("black","red","blue"),legend=c(colnames(c[,7:9])))
plot(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Global_reactive_power,type="l",xlab="Date/Time",ylab="Global reactive power",cex=0.6)

#save plot to png file
dev.copy(png,file="plot4.png")
dev.off

 