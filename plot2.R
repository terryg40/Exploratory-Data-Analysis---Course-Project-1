#load library

library(data.table)

#Load the data file

data <- "./household_power_consumption.txt"

#Read the data file into a variable called power

power <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using the variable subSetPower, take only the data from Feb1-2, 2007

subSetPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

#Using the variable twoDayPower, get setup for plotting graph of power usage during wanted period

twoDayPower <- strptime(paste(subSetPower$Date, subSetPower$Time, sep=" "), "%d/%m/%Y%H:%M:%S")

#Set the variable to numeric

globalActivePower <- as.numeric(subSetPower$Global_active_power)

#Set the dimensions for the plot

png("plot2.png", width=480, height=480)

#Draw the graph of power usage over two days, giving it titles

plot(twoDayPower, globalActivePower, type="l", main="Global Active Power", xlab="", ylab="Global Active Power (kilowatts)")

#Turn off the plot device

dev.off()