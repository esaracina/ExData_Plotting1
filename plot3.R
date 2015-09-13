## Read data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

## Subset data by date
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

## Convert date and time variables to Date/Time classes
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

## Launch graphics device
png(file = "plot3.png", width=480, height=480)

## Initialize and annotate plot
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close graphics device
dev.off()