#load library

library(data.table)

#Load the data file

data <- "./household_power_consumption.txt"

#Read the data file into a variable called power

power <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using the variable subSetPower, take only the data from Feb 1-2, 2007

subSetPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

#Set the variable to numeric

globalActivePower <- as.numeric(subSetPower$Global_active_power)

#Set the dimensions for the plot

png("plot1.png", width=480, height=480)

#Draw the histogram, giving it color and titles

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

#Turn off plot device

dev.off()
