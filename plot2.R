#Load Data from UC Irvine Machine Learning Repository 
#   Individual Household electric power consumption data set
#select data for 2007-02-01 to 2007-02-02
#plot Global Active Power over Date&Time

#NOTE: sqldf package must be installed (run install.packages("sqldf")

#load data for 2007-02-01 to 2007-02-02
library(sqldf)
c<-read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date in ('1/2/2007','2/2/2007')")

#plot to screen
windows()
plot(strptime(paste(c$Date,c$Time),format="%d/%m/%Y %H:%M:%S"),c$Global_active_power,type="l",xlab="",ylab="Global Active Power",cex=0.6)

#save plot to png file
dev.copy(png,file="plot2.png")
dev.off
