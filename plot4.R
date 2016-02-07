plot4<-function(){
	  # read and subset data
	 alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
	 alldata <- subset(alldata, !is.na(Date))
	 alldata[,1] <- as.Date(alldata[,1], "%d/%m/%Y")
	 alldata <- subset(alldata, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
	 newcol <- paste (as.character(alldata[,1]), alldata[,2])
	 alldata <- cbind(alldata, newcol)
	 alldata[,10] <- as.POSIXct(alldata[,10], format="%Y-%m-%d %H:%M:%S")
	 
	 png("plot4.png",width=480, height=480, units="px")
	 
	 par(mfrow=c(2,2))
	 
	 # render plot 1
	 plot(alldata[,10], alldata[,3], type="l", ylab="Global Active Power", xlab="")
	 
	 # render plot 2
	 plot(alldata[,10], alldata[,5], type="l", ylab="Voltage", xlab="datetime", yaxt="n")
	 axis(2,at=seq(234, 246, by=4))
	 
	 # render plot 3
	 yrange <- range(alldata[,7], alldata[,8], alldata[,9])
	 xrange <- range(alldata[,10])
	 plot(xrange, yrange, type="n", ylab="Energy sub metering", xlab="")
	 lines(alldata[,10], alldata[,7], col="black")
	 lines(alldata[,10], alldata[,8], col="red")
	 lines(alldata[,10], alldata[,9], col="blue")
	 legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
	 
	 # render plot 4
	 plot(alldata[,10], alldata[,4], type="l", ylab="Global_reactive_power", xlab="datetime")
	 
	 dev.off()
}