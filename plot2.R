## Coursera Exploratory Data Analysis  Project 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")

# read the part of the file that includes  the header record plus 
# all the data for 2007-02-1 and 2007-02-01
hpc=read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	nrows=69518)

hpc<-hpc[hpc$Date =="1/2/2007" | hpc$Date=="2/2/2007",]

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

hpc$Global_active_power<-as.character(hpc$Global_active_power)
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

png("plot2.png", width=480, height=480, res=120)
with(hpc,plot(Global_active_power ~ DateTime, type="n", 
	ylab="Global Active Power (kilowatts)",	xlab=""))

with(hpc, lines(Global_active_power ~ DateTime))
dev.off()


