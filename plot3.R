## Coursera Exploratory Data Analysis  Project 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")

# read the part of the file that includes  the header record plus 
# all the data for 2007-02-1 and 2007-02-01
hpc=read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	nrows=69518, stringsAsFactors=F, na.strings="?" )

hpc<-hpc[hpc$Date =="1/2/2007" | hpc$Date=="2/2/2007",]

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

#png("plot3.png", width=480, height=480, res=120)

with(hpc,plot(Sub_metering_1 ~ DateTime, type="l", 
 	ylab="Energy sub metering",	xlab=""))
with(hpc, lines(Sub_metering_2 ~ DateTime,col="red"))
with(hpc, lines(Sub_metering_3 ~ DateTime,col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	   lty=1, lwd=2, col=c("black", "red", "blue"))

dev.copy(png, "Plot3.png", height=480, width=480)
dev.off(4)




