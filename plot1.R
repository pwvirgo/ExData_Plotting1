## Coursera Exploratory Data Analysis  Project 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")

# read the part of the file that includes  the header record plus 
# all the data for 2007-02-1 and 2007-02-01
hpc=read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	nrows=69518)
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc<-hpc[hpc$Date >="2007-02-01" & hpc$Date<="2007-02-02",]

hpc$Global_active_power<-as.character(hpc$Global_active_power)
hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

png("plot1.png", width=480, height=480, res=120)
with(hpc, hist(Global_active_power, main="Global Active Power",
			   xlab="Global Active Power (kilowatts)", col="red"))
dev.off()



# hist(hpc$Global_active_power, main="Global Active Power",
#	 xlab="Global Active Power (kilowatts)", col="red")

# with(hpc, hist(Global_active_power, main="Global Active Power",
# 	 xlab="Global Active Power (kilowatts)", col="red"))
# 
# pdf(file="plt.pdf")
# with(hpc, hist(Global_active_power, main="Global Active Power",
# 			   xlab="Global Active Power (kilowatts)", col="red"))
# 
# dev.off()


