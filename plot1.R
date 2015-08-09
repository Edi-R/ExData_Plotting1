#Coursera - Exploratory Data Analysis
#Project 1

#Load Data from UC Irvine Machine Learning Repository 
#   Individual Household electric power consumption data set
#select data for 2007-02-01 to 2007-02-02
#plot a histogram of Global Active Power and output to plot1.png

#NOTE: sqldf package must be installed (run install.packages("sqldf")

#load data for 2007-02-01 to 2007-02-02
library(sqldf)
c<-read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#plot to screen
windows()
hist(c$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#save plot to png file
dev.copy(png,file="plot1.png")
dev.off
