## Coursera Exploratory Data Analysis  Project 1

setwd("~/a/highEd/dataScience_coursera/ExploreData/data")

# read the part of the file that includes  the header record plus 
# all the data for 2007-02-1 and 2007-02-01
hpc=read.table("household_power_consumption.txt", sep=";", header=TRUE, 
	nrows=69518)
hpc$Date<-as.Date(hpc$Date, format="%d/%m/%Y")
hpc<-hpc[hpc$Date >="2007-02-01" && hpc$Date<="2007-02-02",]


