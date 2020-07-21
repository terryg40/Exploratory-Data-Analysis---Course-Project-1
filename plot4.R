library(data.table)

#Load the data file

data <- "./household_power_consumption.txt"

#Read the data file into a variable called power

power <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Using the variable subSetPower, take only the data from Feb1-2, 2007

subSetPower <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

#Using the variable twoDayPower, get setup for plotting graph of power usage during wanted period

twoDayPower <- strptime(paste(subSetPower$Date, subSetPower$Time, sep=" "), "%d/%m/%Y%H:%M:%S")

#Set the variables to numeric

globalActivePower <- as.numeric(subSetPower$Global_active_power)

globalReactivePower <- as.numeric(subSetPower$Global_reactive_power)

voltage <- as.numeric(subSetPower$Voltage)

subMetering1 <- as.numeric(subSetPower$Sub_metering_1)

subMetering2 <- as.numeric(subSetPower$Sub_metering_2)

subMetering3 <- as.numeric(subSetPower$Sub_metering_3)

#Set the dimensions for the plot

png("plot4.png", width=480, height=480)

#Makes the plot a 2x2, since there will be four figures in the plot

par(mfrow =c(2,2))

plot(twoDayPower, globalActivePower, type="l", ylab="Global Active Power", xlab="", cex=0.2)

plot(twoDayPower, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(twoDayPower, subMetering1, type="l", ylab="Energy sub metering", xlab="")

lines(twoDayPower, subMetering2, type="l", col="red")

lines(twoDayPower, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(twoDayPower, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Turns off plot device

dev.off()