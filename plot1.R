plot1<-function(){
	 alldata <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
	 alldata <- subset(alldata, !is.na(Date))
	 alldata[,1] <- as.Date(alldata[,1], "%d/%m/%Y")
	 alldata <- subset(alldata, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
	 png("plot1.png",width=480, height=480, units="px")
	 hist(alldata[,3], col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)", ylab="Frequency")
	 dev.off()
}