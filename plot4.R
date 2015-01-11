## Coursera Exploratory Data Analysis  Project 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")

# read the part of the file that includes  the header record plus 
# all the data for 2007-02-1 and 2007-02-01
# stringsAsFactors=F and the numbers are class numeric!
hpc=read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	nrows=69518, stringsAsFactors=F, na.strings="?" )

hpc<-hpc[hpc$Date =="1/2/2007" | hpc$Date=="2/2/2007",]

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(2,4,1,2), oma=c(0,0,0,0), ps=10)

with(hpc, {
	plot(Global_active_power ~ DateTime, type="l", 
		 ylab="Global Active Power (kilowatts)",	xlab="")

	plot(Voltage ~ DateTime, type="l", ylab="Voltage", xlab="datetime")
	
	plot(Sub_metering_1 ~ DateTime, type="l",  ylab="Energy sub metering",	xlab="")
	lines(Sub_metering_2 ~ DateTime,col="red")
	lines(Sub_metering_3 ~ DateTime,col="blue")
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	   lty=1, lwd=2, col=c("black", "red", "blue"))
	
	plot(Global_reactive_power ~ DateTime, type="l", xlab="datetime")
})

dev.copy(png, "Plot4.png", height=480, width=480)
dev.off(4)

