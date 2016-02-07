plot2<-function(){
	 alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
	 alldata <- subset(alldata, !is.na(Date))
	 alldata[,1] <- as.Date(alldata[,1], "%d/%m/%Y")
	 alldata <- subset(alldata, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
	 newcol <- paste (as.character(alldata[,1]), alldata[,2])
	 alldata <- cbind(alldata, newcol)
	 alldata[,10] <- as.POSIXct(alldata[,10], format="%Y-%m-%d %H:%M:%S")
	 png("plot2.png",width=480, height=480, units="px")
	 plot(alldata[,10], alldata[,3], type="l", ylab="Global Active Power(kilowatts)", xlab="")
	 dev.off()
}