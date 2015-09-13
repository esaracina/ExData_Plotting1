## Read data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Subset data by date
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

## Convert date and time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Launch graphics device
png(file = "plot4.png", width=480, height=480)

## Set up for multiple plots
par(mfrow = c(2,2))

## Create plot 1
plot(data$DateTime, data$Global_active_power, type = "l", ylab="Global Active Power", xlab="")

## Create plot 2
plot(data$DateTime, data$Voltage, type = "l", ylab="Voltage", xlab="datetime")

## Create plot 3
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create plot 4
plot(data$DateTime, data$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")

## Close graphics device
dev.off()